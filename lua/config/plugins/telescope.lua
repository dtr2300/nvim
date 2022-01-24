M = {}

-- sessions picker
function M.list_sessions()
  local opts = {
    search_dirs = {"~/.cache/vim/session"},
    previewer = false,
    prompt_title = "Open Session",
    attach_mappings = function(buf, map)
      map("i", "<c-e>", function(_)
        local entry = require"telescope.actions.state".get_selected_entry()
        require"telescope.actions".close(buf)
        vim.cmd("source " .. entry.value)
      end)
      return true
    end
  }
  require"telescope.builtin".find_files(require"telescope.themes".get_dropdown(opts))
end

-- change dir
local function cd(buf)
  local entry = require"telescope.actions.state".get_selected_entry()
  require"telescope.actions".close(buf)
  local dir = vim.fn.fnamemodify(entry.value, ":p:h")
  vim.cmd(string.format("silent lcd %s", dir))
end

-- setup
function M.setup()
  local map = require"config.utils.map".map

  require"telescope".setup {
    defaults = {
      prompt_prefix = ' ',
      file_ignore_patterns = {"__pycache__", "venv"},
      mappings = {
        i = {
          ["<esc>"] = require"telescope.actions".close,
          ["<C-/>"] = "which_key",
          ["<M-f>"] = cd
        },
        n = {
          ["<esc>"] = require"telescope.actions".close,
        },
      },
    },
    pickers = {
    },
    extensions = {
    },
  }

  -- telescope repo list: keep opts.cwd
  require"telescope._extensions.repo.list".prepare_command = function(opts)
    local utils = require"telescope._extensions.repo.utils"
    opts = opts or {}
    opts.bin = opts.bin or utils.find_fd_binary()
    if opts.bin == "" then
      error("fd not found, is fd installed?")
    end
    opts.cwd = opts.cwd or vim.env.HOME

    local fd_command = {opts.bin}
    local repo_pattern = opts.pattern or [[^\.git$]]

    local find_repo_opts = {"--hidden", "--case-sensitive", "--absolute-path"}
    local find_user_opts = opts.fd_opts or {}
    local find_exec_opts = {"--exec", "echo", [[{//}]], ";"}
    local find_pattern_opts = {repo_pattern}

    table.insert(fd_command, find_repo_opts)
    table.insert(fd_command, find_user_opts)
    table.insert(fd_command, find_exec_opts)
    table.insert(fd_command, find_pattern_opts)
    fd_command = vim.tbl_flatten(fd_command)

    return fd_command
  end

  -- load extensions
  require"telescope".load_extension "file_browser"
  require"telescope".load_extension "repo"

  -- mappings
  map("n", "<Leader>tb", "<Cmd>Telescope builtin<CR>")
  map("n", "<Leader>tB", "<Cmd>Telescope buffers<CR>")
  map("n", "<Leader>tC", "<Cmd>Telescope commands<CR>")
  map("n", "<Leader>tc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
  map("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>")
  map("n", "<Leader>tF", "<Cmd>Telescope file_browser<CR>")
  map("n", "<Leader>tg", "<Cmd>Telescope git_files<CR>")
  map("n", "<Leader>th", "<Cmd>Telescope help_tags<CR>")
  map("n", "<Leader>tj", "<Cmd>Telescope jumplist<CR>")
  map("n", "<Leader>tk", "<Cmd>Telescope keymaps<CR>")
  map("n", "<Leader>tl", "<Cmd>Telescope live_grep<CR>")
  map("n", "<Leader>tm", "<Cmd>Telescope marks<CR>")
  map("n", "<Leader>to", "<Cmd>Telescope oldfiles<CR>")
  map("n", "<Leader>tP", "<Cmd>Telescope pickers<CR>")
  map("n", "<Leader>tq", "<Cmd>Telescope quickfix<CR>")
  map("n", "<Leader>t1", "<Cmd>Telescope repo list<CR>")
  map("n", "<Leader>t2", "<Cmd>lua require'telescope'.extensions.repo.list {cwd='f:/devel'}<CR>")
  map("n", "<Leader>t3", "<Cmd>lua require'telescope'.extensions.repo.list {cwd='f:/devel/py'}<CR>")
  map("n", "<Leader>tr", "<Cmd>Telescope registers<CR>")
  map("n", "<Leader>tR", "<Cmd>Telescope resume<CR>")
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

  map("n", "<Leader>ss", "<Cmd>lua require'config.plugins.telescope'.list_sessions()<CR>")

end

return M
