local M = {}

local def_opts = { noremap = true, silent = true }

function M.buf_map(mode, key, cmd, opts)
  vim.api.nvim_buf_set_keymap(0, mode, key, cmd, opts or def_opts)
end

function M.map(mode, key, cmd, opts)
  vim.api.nvim_set_keymap(mode, key, cmd, opts or def_opts)
end

return M
