local M = {}

function M.exec_selected_rows()
  local _, end_row, _ = unpack(vim.fn.getcurpos())
  local start_row = vim.fn.line "v"
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, true)
  assert(loadstring(table.concat(lines, "\n")))()
end

return M
