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
  vim.api.nvim_create_autocmd("TermClose", {
    buffer = 0,
    callback = function()
      vim.api.nvim_win_close(win, { force = true })
      vim.api.nvim_buf_delete(buf, { force = true })
    end,
  })
end

return M
