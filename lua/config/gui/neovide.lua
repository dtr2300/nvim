local M = {}

local fontname = "FiraCode NF"
local fontsize_default = 10
local fontsize = fontsize_default

---@param size? number
function M.set_fontsize(size)
  fontsize = size or fontsize_default
  vim.opt.guifont = fontname .. ":h" .. fontsize
end

---@param amount number
function M.adjust_fontsize(amount)
  M.set_fontsize(fontsize + amount)
end

function M.setup()
  vim.g.neovide_cursor_animation_length = 0
  M.set_fontsize()
  vim.keymap.set("n", "<F7>", function()
    require("config.gui.neovide").adjust_fontsize(1)
  end, { silent = true, desc = "Adjust fontsize +1" })
  vim.keymap.set("n", "<S-F7>", function()
    require("config.gui.neovide").adjust_fontsize(-1)
  end, { silent = true, desc = "Adjust fontsize -1" })
  vim.keymap.set("n", "<C-F7>", function()
    require("config.gui.neovide").set_fontsize()
  end, { silent = true, desc = "Reset fontsize" })
  vim.keymap.set("n", "<F11>", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end, { silent = true, desc = "Toggle fullscreen" })
end

return M
