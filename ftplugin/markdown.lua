local buf_map = require("config.utils.map").buf_map

-- markdown preview
buf_map("n", "<F4>", '<Cmd>term glow -p "%"<CR>')
