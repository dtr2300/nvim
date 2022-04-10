vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2

-- execute current buffer
vim.keymap.set("n", "<F2>", "<Cmd>source %<CR>", { silent = true, buffer = true })
-- execute selected rows
vim.keymap.set("v", "<F4>", function()
  local _, end_row, _ = unpack(vim.fn.getcurpos())
  local start_row = vim.fn.line "v"
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, true)
  assert(loadstring(table.concat(lines, "\n")))()
end, { silent = true, buffer = true })
