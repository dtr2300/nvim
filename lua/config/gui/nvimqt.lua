local M = {}

local fontname = "FiraCode NF"
local fontsize = 10
local isfullscreen = false

function M.adjust_fontsize(amount)
  fontsize = fontsize + (amount or 0)
  vim.cmd("GuiFont! " .. fontname .. ":h" .. fontsize)
end

function M.fullscreen_toggle()
  isfullscreen = not isfullscreen
  vim.cmd("call GuiWindowFullScreen(" .. (isfullscreen and 1 or 0) .. ")")
end

function M.setup()
  local map = require("config.utils.map").map

  vim.cmd [[
  GuiTabline 0
  GuiPopupmenu 0
  ]]

  M.adjust_fontsize()

  map("n", "<C-ScrollWheelUp>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(1)<CR>")
  map("n", "<C-ScrollWheelDown>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(-1)<CR>")
  map("i", "<C-ScrollWheelUp>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(1)<CR>")
  map("i", "<C-ScrollWheelDown>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(-1)<CR>")
  map("n", "<F11>", "<Cmd>lua require'config.gui.nvimqt'.fullscreen_toggle()<CR>")
end

return M
