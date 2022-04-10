vim.opt.guifont = "FiraCode NF:h13"
vim.cmd "FVimCustomTitleBar v:true"

vim.keymap.set({ "n", "i" }, "<C-ScrollWheelUp>", "<Cmd>set guifont=+<CR>", { silent = true })
vim.keymap.set({ "n", "i" }, "<C-ScrollWheelDown>", "<Cmd>set guifont=-<CR>", { silent = true })
vim.keymap.set("n", "<F7>", "<Cmd>set guifont=+<CR>", { silent = true })
vim.keymap.set("n", "<S-F7>", "<Cmd>set guifont=-<CR>", { silent = true })
vim.keymap.set("n", "<F11>", "<Cmd>FVimToggleFullScreen<CR>", { silent = true })
