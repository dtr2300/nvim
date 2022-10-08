local M = {}

-- called from ginit.vim
function M.setup()
  if vim.g.neovide then
    require("config.gui.neovide").setup()
  elseif vim.g.GuiLoaded then
    require("config.gui.nvimqt").setup()
  end
end

return M
