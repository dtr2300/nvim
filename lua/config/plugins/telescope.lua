local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

-- change dir attach mapping
local function cd(buf)
  actions.close(buf)
  local selection = action_state.get_selected_entry()
  local cwd = vim.fn.fnamemodify(selection.value, ":p:h")
  vim.cmd("silent lcd " .. cwd)
  require("config.utils.sessions").info()
end

-- setup
require("telescope").setup {
  defaults = {
    prompt_prefix = " ",
    file_ignore_patterns = { "__pycache__", "venv" },
    --wrap_results = true,
    layout_config = {
      horizontal = {
        width = 0.99,
        height = 0.99,
        preview_width = 0.5,
        preview_cutoff = 20,
      },
    },
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-/>"] = "which_key",
        ["<M-f>"] = cd,
      },
      n = {
        ["<Esc>"] = actions.close,
      },
    },
  },
  pickers = {},
  extensions = {},
}

-- load extensions
for _, ext in ipairs { "file_browser", "repo", "fzf" } do
  require("telescope").load_extension(ext)
end

-- mappings
if vim.fn.has "nvim-0.7" == 1 then
  vim.keymap.set("n", "<Leader>tB", "<Cmd>Telescope builtin<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tb", "<Cmd>Telescope buffers<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tC", "<Cmd>Telescope commands<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tF", "<Cmd>Telescope file_browser<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tg", "<Cmd>Telescope git_files<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>th", "<Cmd>Telescope help_tags<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tH", "<Cmd>Telescope highlights<CR>", { silent = true })
  vim.keymap.set("n", "<F1>", "<Cmd>Telescope help_tags<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>ti", "<Cmd>Telescope git_commits<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tj", "<Cmd>Telescope jumplist<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tk", "<Cmd>Telescope keymaps<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tl", "<Cmd>Telescope live_grep<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tm", "<Cmd>Telescope marks<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>to", "<Cmd>Telescope oldfiles<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tp", "<Cmd>Telescope pickers<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tq", "<Cmd>Telescope quickfix<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>t1", "<Cmd>Telescope repo list<CR>", { silent = true })
  if vim.fn.has "win32" == 1 then
    vim.keymap.set("n", "<Leader>t2", function()
      require("telescope").extensions.repo.list { search_dirs = { "f:/devel" } }
    end, { silent = true })
    vim.keymap.set("n", "<Leader>t3", function()
      require("telescope").extensions.repo.list { search_dirs = { "f:/devel/py" } }
    end, { silent = true })
    vim.keymap.set("n", "<Leader>t4", function()
      require("telescope").extensions.repo.list { search_dirs = { "d:/msys64/home/Dieter" } }
    end, { silent = true })
  end
  vim.keymap.set("n", "<Leader>tR", "<Cmd>Telescope registers<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tr", "<Cmd>Telescope resume<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>ts", "<Cmd>Telescope git_status<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tt", "<Cmd>Telescope treesitter<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>tv", "<Cmd>Telescope vim_options<CR>", { silent = true })

  vim.keymap.set("n", "<Leader>lc", "<Cmd>Telescope lsp_code_actions<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>ld", "<Cmd>Telescope lsp_definitions<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>lx", "<Cmd>Telescope diagnostics<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>lD", "<Cmd>Telescope lsp_document_symbols<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>ly", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>li", "<Cmd>Telescope lsp_implementations<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>lr", "<Cmd>Telescope lsp_references<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>lt", "<Cmd>Telescope lsp_type_definitions<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>lw", "<Cmd>Telescope lsp_workspace_symbols<CR>", { silent = true })
else
  local map = require("config.utils.map").map
  map("n", "<Leader>tB", "<Cmd>Telescope builtin<CR>")
  map("n", "<Leader>tb", "<Cmd>Telescope buffers<CR>")
  map("n", "<Leader>tC", "<Cmd>Telescope commands<CR>")
  map("n", "<Leader>tc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
  map("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>")
  map("n", "<Leader>tF", "<Cmd>Telescope file_browser<CR>")
  map("n", "<Leader>tg", "<Cmd>Telescope git_files<CR>")
  map("n", "<Leader>th", "<Cmd>Telescope help_tags<CR>")
  map("n", "<Leader>tH", "<Cmd>Telescope highlights<CR>")
  map("n", "<F1>", "<Cmd>Telescope help_tags<CR>")
  map("n", "<Leader>ti", "<Cmd>Telescope git_commits<CR>")
  map("n", "<Leader>tj", "<Cmd>Telescope jumplist<CR>")
  map("n", "<Leader>tk", "<Cmd>Telescope keymaps<CR>")
  map("n", "<Leader>tl", "<Cmd>Telescope live_grep<CR>")
  map("n", "<Leader>tm", "<Cmd>Telescope marks<CR>")
  map("n", "<Leader>to", "<Cmd>Telescope oldfiles<CR>")
  map("n", "<Leader>tp", "<Cmd>Telescope pickers<CR>")
  map("n", "<Leader>tq", "<Cmd>Telescope quickfix<CR>")
  map("n", "<Leader>t1", "<Cmd>Telescope repo list<CR>")
  if vim.fn.has "win32" == 1 then
    map("n", "<Leader>t2", "<Cmd>lua require'telescope'.extensions.repo.list {search_dirs={'f:/devel'}}<CR>")
    map("n", "<Leader>t3", "<Cmd>lua require'telescope'.extensions.repo.list {search_dirs={'f:/devel/py'}}<CR>")
    map(
      "n",
      "<Leader>t4",
      "<Cmd>lua require'telescope'.extensions.repo.list {search_dirs={'d:/msys64/home/Dieter'}}<CR>"
    )
  end
  map("n", "<Leader>tR", "<Cmd>Telescope registers<CR>")
  map("n", "<Leader>tr", "<Cmd>Telescope resume<CR>")
  map("n", "<Leader>ts", "<Cmd>Telescope git_status<CR>")
  map("n", "<Leader>tt", "<Cmd>Telescope treesitter<CR>")
  map("n", "<Leader>tv", "<Cmd>Telescope vim_options<CR>")

  map("n", "<Leader>lc", "<Cmd>Telescope lsp_code_actions<CR>")
  map("n", "<Leader>ld", "<Cmd>Telescope lsp_definitions<CR>")
  map("n", "<Leader>lx", "<Cmd>Telescope diagnostics<CR>")
  map("n", "<Leader>lD", "<Cmd>Telescope lsp_document_symbols<CR>")
  map("n", "<Leader>ly", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
  map("n", "<Leader>li", "<Cmd>Telescope lsp_implementations<CR>")
  map("n", "<Leader>lr", "<Cmd>Telescope lsp_references<CR>")
  map("n", "<Leader>lt", "<Cmd>Telescope lsp_type_definitions<CR>")
  map("n", "<Leader>lw", "<Cmd>Telescope lsp_workspace_symbols<CR>")
end
