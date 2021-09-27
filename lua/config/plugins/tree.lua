local M = {}

-- adjust barbar offset for nvim-tree
function M.toggle_tree()
  if require"nvim-tree.view".win_open() then
    require"bufferline.state".set_offset(0)
  else
    local width = require"nvim-tree.view".View.width + 1
    require"bufferline.state".set_offset(width, "FileTree")
  end
  require"nvim-tree".toggle()
end

function M.setup()
  local map = require"config.utils.map".map

  vim.g.nvim_tree_ignore = {".git", "venv", ".cache", "__pycache__"}
  vim.g.nvim_tree_git_hl = 1

  require"nvim-tree".setup {
    disable_netrw = false,
    ignore_ft_on_setup = {"alpha"},
    auto_close = true,
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {"help"}
    }
  }

  map("n", "<Leader>tt", "<Cmd>lua require'config.plugins.tree'.toggle_tree()<CR>")
  map("n", "<Leader>tr", "<Cmd>NvimTreeRefresh<CR>")
  map("n", "<Leader>tf", "<Cmd>NvimTreeFindFile<CR>")
end

return M
