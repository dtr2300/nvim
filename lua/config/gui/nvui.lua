local M = {}

local fontname = "FiraCode NF"
local fontsize = 10
local nvui_install_path = "d:\\Program Files\\nvui"

function M.adjust_fontsize(amount)
  fontsize = fontsize + amount
  vim.opt.guifont = fontname .. ":h" .. fontsize
end

function M.setup()
  local map = require"config.utils.map".map

  M.adjust_fontsize(0)
  vim.cmd("source " .. nvui_install_path .. "\\vim\\plugin\\nvui.vim")
  vim.cmd[[
    NvuiCursorFrametime 0
    NvuiCmdFontFamily FiraCode NF
  ]]

  map("n", "<C-ScrollWheelUp>", "<Cmd>silent! lua require'config.gui.nvui'.adjust_fontsize(1)<CR>")
  map("n", "<C-ScrollWheelDown>", "<Cmd>silent! lua require'config.gui.nvui'.adjust_fontsize(-1)<CR>")
  map("i", "<C-ScrollWheelUp>", "<Cmd>silent! lua require'config.gui.nvui'.adjust_fontsize(1)<CR>")
  map("i", "<C-ScrollWheelDown>", "<Cmd>silent! lua require'config.gui.nvui'.adjust_fontsize(-1)<CR>")
  map("n", "<F11>", "<Cmd>NvuiToggleFullscreen<CR>")
end

return M
