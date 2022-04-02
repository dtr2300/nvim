if vim.fn.has "win32" == 0 then
  return
end

local buf_map = require("config.utils.map").buf_map

buf_map("n", "<S-F1>", "<Cmd>lua require'config.utils.sc'.schelp(require'telescope.themes'.get_dropdown())<CR>")
buf_map("n", "<F8>", "<Cmd>lua require'config.utils.sc'.play_scale()<CR>")
buf_map("n", "<F5>", "<Cmd>SCNvimStart<CR>")
buf_map("n", "<F6>", "<Cmd>SCNvimStop<CR>")
