local M = {}

function M.toggle_colors()
  -- toggle onedark colors
  require("onedark").toggle()

  -- reload lualine
  R "config.plugins.lualine"
end

return M
