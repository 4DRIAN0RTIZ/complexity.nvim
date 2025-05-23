-- lua/config/complexity/colors.lua
local config = require("complexity.config")
local M = {}

function M.setup()
  vim.api.nvim_set_hl(0, 'LowComplexity',    { fg = "#00ff00" })
  vim.api.nvim_set_hl(0, 'MediumComplexity', { fg = "#ffff00" })
  vim.api.nvim_set_hl(0, 'HighComplexity',   { fg = "#ff0000" })
  vim.api.nvim_set_hl(0, 'DefaultComplexity', { fg = "#ffffff" })
end

function M.get_color(ccn)
  local num = tonumber(ccn)
  if not num then
    return 'DefaultComplexity'
  elseif num <= config.thresholds.low then
    return 'LowComplexity'
  elseif num <= config.thresholds.medium then
    return 'MediumComplexity'
  else
    return 'HighComplexity'
  end
end

return M
