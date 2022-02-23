vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

local buf_map = require("config.utils.map").buf_map

-- execute current buffer
buf_map("n", "<F2>", "<Cmd>source %<CR>")
-- execute selected rows
buf_map("v", "<F4>", [[<Cmd>lua require'config.utils.exec'.exec_selected_rows()<CR>]])
