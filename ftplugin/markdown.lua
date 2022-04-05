if vim.fn.has "nvim-0.7" == 1 then
  -- preview markdown
  vim.keymap.set("n", "<F2>", '<Cmd>term glow -p "%"<CR>', { silent = true, buffer = true })
else
  local buf_map = require("config.utils.map").buf_map
  -- preview markdown
  buf_map("n", "<F2>", '<Cmd>term glow -p "%"<CR>')
end
