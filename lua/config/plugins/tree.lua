local M = {}

-- adjust barbar offset for nvim-tree
function M.toggle_tree()
  if require"nvim-tree.view".win_open() then
    require"bufferline.state".set_offset(0)
  else
    require"bufferline.state".set_offset(31, "FileTree")
  end
  require"nvim-tree".toggle()
end

function M.setup()
  local map = require"config.utils.map".map

  vim.g.nvim_tree_ignore = {".git", "venv", ".cache", "__pycache__"}
  vim.g.nvim_tree_auto_close = 1
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_auto_ignore_ft = {"dashboard", "alpha"}
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_update_cwd = 1
  vim.g.nvim_tree_follow_update_path = 1
  vim.g.nvim_tree_disable_netrw = 0

  map("n", "<Leader>tt", "<Cmd>lua require'config.plugins.tree'.toggle_tree()<CR>")
  map("n", "<Leader>tr", "<Cmd>NvimTreeRefresh<CR>")
  map("n", "<Leader>tf", "<Cmd>NvimTreeFindFile<CR>")
end

return M
