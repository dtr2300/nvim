local buf_map = require("config.utils.map").buf_map

-- preview markdown
buf_map("n", "<F2>", '<Cmd>term glow -p "%"<CR>')
