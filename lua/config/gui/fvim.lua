local map = require"config.utils.map".map

vim.opt.guifont = "FiraCode NF:h13"
vim.cmd "FVimCustomTitleBar v:true"

map("n", "<C-ScrollWheelUp>", "<Cmd>set guifont=+<CR>")
map("n", "<C-ScrollWheelDown>", "<Cmd>set guifont=-<CR>")
map("i", "<C-ScrollWheelUp>", "<Cmd>set guifont=+<CR>")
map("i", "<C-ScrollWheelDown>", "<Cmd>set guifont=-<CR>")
map("n", "<F11>", "<Cmd>FVimToggleFullScreen<CR>")
