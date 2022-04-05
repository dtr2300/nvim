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
  vim.cmd "let g:neovide_cursor_animation_length=0" -- vim.g doesn't work

  M.adjust_fontsize()

  if vim.fn.has "nvim-0.7" == 1 then
    vim.keymap.set("n", "<F7>", function()
      require("config.gui.neovide").adjust_fontsize(1)
    end, { silent = true })
    vim.keymap.set("n", "<S-F7>", function()
      require("config.gui.neovide").adjust_fontsize(-1)
    end, { silent = true })
    vim.keymap.set("n", "<F11>", require("config.gui.neovide").fullscreen_toggle, { silent = true })
  else
    local map = require("config.utils.map").map
    map("n", "<F7>", "<Cmd>lua require'config.gui.neovide'.adjust_fontsize(1)<CR>")
    map("n", "<S-F7>", "<Cmd>lua require'config.gui.neovide'.adjust_fontsize(-1)<CR>")
    map("n", "<F11>", "<Cmd>lua require'config.gui.neovide'.fullscreen_toggle()<CR>")
  end
end

return M
