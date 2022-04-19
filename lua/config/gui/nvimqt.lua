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

  vim.keymap.set({ "n", "i" }, "<C-ScrollWheelUp>", function()
    require("config.gui.nvimqt").adjust_fontsize(1)
  end, { silent = true, desc = "Adjust fontsize +1" })
  vim.keymap.set({ "n", "i" }, "<C-ScrollWheelDown>", function()
    require("config.gui.nvimqt").adjust_fontsize(-1)
  end, { silent = true, desc = "Fontsize -1" })
  vim.keymap.set("n", "<F7>", function()
    require("config.gui.nvimqt").adjust_fontsize(1)
  end, { silent = true, desc = "Fontsize +1" })
  vim.keymap.set("n", "<S-F7>", function()
    require("config.gui.nvimqt").adjust_fontsize(-1)
  end, { silent = true, desc = "Fontsize -1" })
  vim.keymap.set(
    "n",
    "<F11>",
    require("config.gui.nvimqt").fullscreen_toggle,
    { silent = true, desc = "Toggle fullscreen" }
  )
end

return M
