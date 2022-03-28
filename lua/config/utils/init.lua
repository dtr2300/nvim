local M = {}

-- append n blank lines
function M.append_blank_lines()
  vim.fn.append(vim.fn.line ".", vim.fn["repeat"]({ "" }, vim.api.nvim_get_vvar "count1"))
end

-- execute lua for selected rows
function M.exec_selected_rows()
  local _, end_row, _ = unpack(vim.fn.getcurpos())
  local start_row = vim.fn.line "v"
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, true)
  assert(loadstring(table.concat(lines, "\n")))()
end

return M
