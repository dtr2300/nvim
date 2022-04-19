local M = {}

local fontname = "FiraCode NF"
local fontsize = 10
local nvui_install_path = "d:\\Program Files\\nvui"

function M.adjust_fontsize(amount)
  fontsize = fontsize + (amount or 0)
  vim.opt.guifont = fontname .. ":h" .. fontsize
end

function M.setup()
  vim.cmd("source " .. nvui_install_path .. "\\vim\\plugin\\nvui.vim")
  vim.cmd [[
    NvuiCursorFrametime 0
    NvuiCmdFontFamily FiraCode NF
    function! NvuiGetTitle()
      return "neovim"
    endfunction
  ]]

  M.adjust_fontsize()

  vim.keymap.set({ "n", "i" }, "<C-ScrollWheelUp>", function()
    require("config.gui.nvui").adjust_fontsize(1)
  end, { silent = true, desc = "Adjust fontsize +1" })
  vim.keymap.set({ "n", "i" }, "<C-ScrollWheelDown>", function()
    require("config.gui.nvui").adjust_fontsize(-1)
  end, { silent = true, desc = "Adjust fontsize -1" })
  vim.keymap.set("n", "<F7>", function()
    require("config.gui.nvui").adjust_fontsize(1)
  end, { silent = true, desc = "Adjust fontsize +1" })
  vim.keymap.set("n", "<S-F7>", function()
    require("config.gui.nvui").adjust_fontsize(-1)
  end, { silent = true, desc = "Adjust fontsize -1" })
  vim.keymap.set("n", "<F11>", "<Cmd>NvuiToggleFullscreen<CR>", { silent = true })
end

return M
