if vim.fn.has "nvim-0.7" == 1 then
  -- execute current buffer
  vim.keymap.set("n", "<F2>", "<Cmd>source %<CR>", { silent = true, buffer = true })
else
  local buf_map = require("config.utils.map").buf_map
  -- execute current buffer
  buf_map("n", "<F2>", "<Cmd>source %<CR>")
end
