local M = {}

function M.toggle_colors()
  -- toggle onedark colors
  require("onedark").toggle()

  -- update tabline_framework colors
  --local ok, Config = pcall(require, "tabline_framework.config")
  --if ok then
  --  local c = require "onedark.colors"
  --  Config.hl = { fg = c.light_grey, bg = c.bg1 }
  --  Config.hl_sel = { fg = c.fg, bg = c.bg3 }
  --  Config.hl_fill = { fg = c.fg, bg = c.bg0 }
  --end

  -- reload lualine
  R "config.plugins.lualine"
end

return M
