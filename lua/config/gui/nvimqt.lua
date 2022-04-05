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
  vim.cmd [[
  GuiTabline 0
  GuiPopupmenu 0
  ]]

  M.adjust_fontsize()

  if vim.fn.has "nvim-0.7" == 1 then
    vim.keymap.set({ "n", "i" }, "<C-ScrollWheelUp>", function()
      require("config.gui.nvimqt").adjust_fontsize(1)
    end, { silent = true })
    vim.keymap.set({ "n", "i" }, "<C-ScrollWheelDown>", function()
      require("config.gui.nvimqt").adjust_fontsize(-1)
    end, { silent = true })
    vim.keymap.set("n", "<F7>", function()
      require("config.gui.nvimqt").adjust_fontsize(1)
    end, { silent = true })
    vim.keymap.set("n", "<S-F7>", function()
      require("config.gui.nvimqt").adjust_fontsize(-1)
    end, { silent = true })
    vim.keymap.set("n", "<F11>", require("config.gui.nvimqt").fullscreen_toggle, { silent = true })
  else
    local map = require("config.utils.map").map
    map("n", "<C-ScrollWheelUp>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(1)<CR>")
    map("n", "<C-ScrollWheelDown>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(-1)<CR>")
    map("i", "<C-ScrollWheelUp>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(1)<CR>")
    map("i", "<C-ScrollWheelDown>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(-1)<CR>")
    map("n", "<F7>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(1)<CR>")
    map("n", "<S-F7>", "<Cmd>silent! lua require'config.gui.nvimqt'.adjust_fontsize(-1)<CR>")
    map("n", "<F11>", "<Cmd>lua require'config.gui.nvimqt'.fullscreen_toggle()<CR>")
  end
end

return M
