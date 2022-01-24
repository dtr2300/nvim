local map = require"config.utils.map".map

vim.g.nvim_tree_git_hl = 1
--vim.g.nvim_tree_respect_buf_cwd = 1

require"nvim-tree".setup {
  disable_netrw = false,
  ignore_ft_on_setup = {"alpha"},
  auto_close = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {"help"}
  },
  filters = {
    dotfiles = false,
    custom = {".git", "venv", ".cache", "__pycache__"}
  }
}

-- adjust barbar offset for nvim-tree
local toggle = require"nvim-tree".toggle

require"nvim-tree".toggle = function()
  if package.loaded["bufferline.state"] and vim.o.tabline ~= "" then
    if require"nvim-tree.view".win_open() then
      require"bufferline.state".set_offset(0)
    else
      local width = require"nvim-tree.view".View.width + 1
      require"bufferline.state".set_offset(width, "FileTree")
    end
  end
  toggle()
end

map("n", "<Leader>xx", "<Cmd>NvimTreeToggle<CR>")
map("n", "<Leader>xr", "<Cmd>NvimTreeRefresh<CR>")
map("n", "<Leader>xf", "<Cmd>NvimTreeFindFile<CR>")
