local M = {}

local fontname = "FiraCode NF"
local fontsize_default = 10
local fontsize = fontsize_default
local isfullscreen = false

function M.set_fontsize(size)
  fontsize = size or fontsize_default
  vim.cmd.GuiFont { fontname .. ":h" .. fontsize, bang = true }
end

function M.adjust_fontsize(amount)
  M.set_fontsize(fontsize + amount)
end

function M.fullscreen_toggle()
  isfullscreen = not isfullscreen
  vim.fn.GuiWindowFullScreen(isfullscreen and 1 or 0)
end

function M.setup()
  vim.cmd.GuiTabline(0)
  vim.cmd.GuiPopupmenu(0)
  M.set_fontsize()
  vim.keymap.set({ "n", "i" }, "<C-ScrollWheelUp>", function()
    require("config.gui.nvimqt").adjust_fontsize(1)
  end, { silent = true, desc = "Adjust fontsize +1" })
  vim.keymap.set({ "n", "i" }, "<C-ScrollWheelDown>", function()
    require("config.gui.nvimqt").adjust_fontsize(-1)
  end, { silent = true, desc = "Adjust fontsize -1" })
  vim.keymap.set("n", "<F7>", function()
    require("config.gui.nvimqt").adjust_fontsize(1)
  end, { silent = true, desc = "Adjust fontsize +1" })
  vim.keymap.set("n", "<S-F7>", function()
    require("config.gui.nvimqt").adjust_fontsize(-1)
  end, { silent = true, desc = "Adjust fontsize -1" })
  vim.keymap.set("n", "<C-F7>", function()
    require("config.gui.nvimqt").set_fontsize()
  end, { silent = true, desc = "Reset fontsize" })
  vim.keymap.set(
    "n",
    "<F11>",
    require("config.gui.nvimqt").fullscreen_toggle,
    { silent = true, desc = "Toggle fullscreen" }
  )
end

return M
