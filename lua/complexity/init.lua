-- complexity/init.lua

local default_config = require("complexity.config")
local colors = require("complexity.colors")
local annotator = require("complexity.annotator")

local M = {}

---
-- Setup the complexity annotator plugin
-- @param user_opts table Optional overrides for default configuration
function M.setup(user_opts)
  local config = vim.tbl_deep_extend("force", default_config, user_opts or {})
  for k, v in pairs(config) do
    default_config[k] = v
  end

  colors.setup()

  vim.api.nvim_create_user_command(
    config.user_command or "ShowComplexity",
    function() annotator.annotate_functions() end,
    {}
  )

  if config.autosave then
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = config.autosave_patterns or "*.php",
      callback = function()
        vim.cmd(config.user_command or "ShowComplexity")
      end,
    })
  end
end

return M
