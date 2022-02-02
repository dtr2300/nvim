M = {}

--- @param cmd string optional
function M.float_terminal(cmd)
  if not cmd then
    cmd = vim.fn.has "win32" == 1 and "cmd" or "zsh"
  end
  local buf = vim.api.nvim_create_buf(false, true)
  local vpad = 4
  local hpad = 10
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = math.min(vim.o.columns - hpad * 2, 140),
    height = math.min(vim.o.lines - vpad * 2, 45),
    row = vpad,
    col = hpad,
    style = "minimal",
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  })
  vim.fn.termopen(cmd)
  local autocmd = {
    "autocmd! TermClose <buffer> lua",
    string.format("vim.api.nvim_win_close(%d, {force = true});", win),
    string.format("vim.api.nvim_buf_delete(%d, {force = true});", buf),
  }
  vim.cmd(table.concat(autocmd, " "))
  --vim.cmd "startinsert"
end

return M
