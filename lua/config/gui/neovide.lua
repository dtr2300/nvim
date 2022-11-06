local M = {}

-- options set via lua vim.g doesn't work
-- see:
--   https://github.com/neovide/neovide/issues/888#issuecomment-898928509
--   https://github.com/neovim/neovim/pull/15373

local fontname = "FiraCode NFM"
local fontsize = 10
local isfullscreen = false

function M.adjust_fontsize(amount)
  fontsize = fontsize + (amount or 0)
  vim.opt.guifont = fontname .. ":h" .. fontsize
end

function M.fullscreen_toggle()
  isfullscreen = not isfullscreen
  vim.cmd("let g:neovide_fullscreen=v:" .. tostring(isfullscreen))
end

function M.setup()
  vim.cmd "let g:neovide_cursor_animation_length=0"

  M.adjust_fontsize()

  vim.keymap.set("n", "<F7>", function()
    require("config.gui.neovide").adjust_fontsize(1)
  end, { silent = true, desc = "Adjust fontsize +1" })
  vim.keymap.set("n", "<S-F7>", function()
    require("config.gui.neovide").adjust_fontsize(-1)
  end, { silent = true, desc = "Adjust fontsize -1" })
  vim.keymap.set(
    "n",
    "<F11>",
    require("config.gui.neovide").fullscreen_toggle,
    { silent = true, desc = "Toggle fullscreen" }
  )
end

return M
