vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

-- execute current buffer
vim.keymap.set("n", "<F2>", "<Cmd>source %<CR>", { silent = true, buffer = true })
