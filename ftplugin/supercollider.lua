if vim.fn.has("win32") == 0 then
  return
end

local buf_map = require"config.utils.map".buf_map

buf_map("n", "<F5>", "<Cmd>SCNvimStart<CR>")
buf_map("n", "<F6>", "<Cmd>SCNvimStop<CR>")
