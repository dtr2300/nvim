vim.opt.guifont = "FiraCode NF:h13"
vim.cmd "FVimCustomTitleBar v:true"

if vim.fn.has "nvim-0.7" == 1 then
  vim.keymap.set({ "n", "i" }, "<C-ScrollWheelUp>", "<Cmd>set guifont=+<CR>", { silent = true })
  vim.keymap.set({ "n", "i" }, "<C-ScrollWheelDown>", "<Cmd>set guifont=-<CR>", { silent = true })
  vim.keymap.set("n", "<F7>", "<Cmd>set guifont=+<CR>", { silent = true })
  vim.keymap.set("n", "<S-F7>", "<Cmd>set guifont=-<CR>", { silent = true })
  vim.keymap.set("n", "<F11>", "<Cmd>FVimToggleFullScreen<CR>", { silent = true })
else
  local map = require("config.utils.map").map
  map("n", "<C-ScrollWheelUp>", "<Cmd>set guifont=+<CR>")
  map("n", "<C-ScrollWheelDown>", "<Cmd>set guifont=-<CR>")
  map("i", "<C-ScrollWheelUp>", "<Cmd>set guifont=+<CR>")
  map("i", "<C-ScrollWheelDown>", "<Cmd>set guifont=-<CR>")
  map("n", "<F7>", "<Cmd>set guifont=+<CR>")
  map("n", "<S-F7>", "<Cmd>set guifont=-<CR>")
  map("n", "<F11>", "<Cmd>FVimToggleFullScreen<CR>")
end
