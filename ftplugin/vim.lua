local buf_map = require("config.utils.map").buf_map

-- execute current buffer
buf_map("n", "<F2>", "<Cmd>source %<CR>")
