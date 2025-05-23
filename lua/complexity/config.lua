-- complexity/config.lua

local M = {
  thresholds = {
    low = 15,     -- CCN <= low is considered low complexity
    medium = 98,  -- CCN > low and <= medium is medium complexity
    -- CCN > medium is high complexity
  },

  -- Extmark settings
  virt_prefix = "⮕ Complexity:",   -- text prefix for virtual text
  virt_pos = "eol",         -- extmark position ("eol" or "overlay")

  -- Auto-run on save
  autosave = false,           -- set true to annotate on BufWritePost
  autosave_patterns = { "*.php" }, -- file patterns to trigger autosave
}

return M
