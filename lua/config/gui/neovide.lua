local M = {}

local fontname = "FiraCode NF"
local fontsize = 13 -- weird fontsize
local isfullscreen = false

function M.adjust_fontsize(amount)
  fontsize = fontsize + (amount or 0)
  vim.opt.guifont = fontname .. ":h" .. fontsize
end

function M.fullscreen_toggle()
  isfullscreen = not isfullscreen
  vim.cmd("let g:neovide_fullscreen=v:" .. tostring(isfullscreen)) -- vim.g doesn't work
end

function M.setup()
  local map = require("config.utils.map").map

  vim.cmd "let g:neovide_cursor_animation_length=0" -- vim.g doesn't work

  M.adjust_fontsize()

  -- mouse wheel doesn't work
  --map("n", "<C-ScrollWheelUp>", "<Cmd>silent! lua require'config.gui.neovide'.adjust_fontsize(1)<CR>")
  --map("n", "<C-ScrollWheelDown>", "<Cmd>silent! lua require'config.gui.neovide'.adjust_fontsize(-1)<CR>")
  --map("i", "<C-ScrollWheelUp>", "<Cmd>silent! lua require'config.gui.neovide'.adjust_fontsize(1)<CR>")
  --map("i", "<C-ScrollWheelDown>", "<Cmd>silent! lua require'config.gui.neovide'.adjust_fontsize(-1)<CR>")
  map("n", "<F8>", "<Cmd>lua require'config.gui.neovide'.adjust_fontsize(1)<CR>")
  map("n", "<F7>", "<Cmd>lua require'config.gui.neovide'.adjust_fontsize(-1)<CR>")
  map("n", "<F11>", "<Cmd>lua require'config.gui.neovide'.fullscreen_toggle()<CR>")
end

return M
