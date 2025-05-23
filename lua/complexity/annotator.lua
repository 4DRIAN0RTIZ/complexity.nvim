-- lua/config/complexity/annotator.lua

local config = require("complexity.config")
local colors = require("complexity.colors")
local runner = require("complexity.runner")

local M = {}
local ns_id = vim.api.nvim_create_namespace("lizard_ccn")

function M.annotate_functions()
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)

  local filepath = vim.api.nvim_buf_get_name(buf)
  local output = runner.run(filepath)
  if not output then return end

  -- Pattern to parse lizard output
  local pattern = config.parse_pattern or '^(%d+)%s+"([^"]+)"'
  for _, line in ipairs(output) do
    local ccn, quoted = line:match(pattern)
    if ccn and quoted then
      -- Extract start line from quoted text
      local _, start_line = quoted:match("^(.+)@(%d+)%-%d+@.+$")
      if start_line then
        -- Determine highlight group
        local hl = colors.get_color(ccn)
        -- Place virtual text
        vim.api.nvim_buf_set_extmark(buf, ns_id, tonumber(start_line) - 1, 0, {
          virt_text = {{ string.format("%s %s", config.virt_prefix, ccn), hl }},
          virt_text_pos = config.virt_pos or "eol",
        })
      end
    end
  end
end

return M
