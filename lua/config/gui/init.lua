local M = {}

-- Called from /lua/config/init.lua
function M.setup_no_ginit()
  if vim.g.nvy then
    require"config.gui.nvy"
  elseif vim.g.nvui then
    require"config.gui.nvui".setup()
  elseif vim.g.goneovim then
    require"config.gui.goneovim"
  end
end

-- Called from /ginit.vim
function M.setup_ginit()
  if vim.g.neovide then
    require "config.gui.neovide".setup()
  elseif vim.g.fvim_loaded then
    require "config.gui.fvim"
  elseif vim.g.GuiLoaded then
    require "config.gui.nvimqt".setup()
  end
end

return M
