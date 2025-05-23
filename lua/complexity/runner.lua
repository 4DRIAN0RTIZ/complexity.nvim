-- lua/config/complexity/runner.lua
local M = {}

function M.run(filepath)
  local cmd = table.concat({ "lizard --csv", filepath, "| awk -F',' '{ print $2, $6, $5 }'" }, ' ')
  local output = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 then return nil end
  return output
end

return M
