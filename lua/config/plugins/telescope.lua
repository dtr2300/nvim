M = {}

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local make_entry = require "telescope.make_entry"
local themes = require "telescope.themes"

-- change dir attach mapping
local function cd(buf)
  actions.close(buf)
  local selection = action_state.get_selected_entry()
  local cwd = vim.fn.fnamemodify(selection.value, ":p:h")
  vim.cmd("silent lcd " .. cwd)
  vim.notify(vim.loop.cwd())
end

-- sessions picker
local sessions = function(opts)
  opts = opts or {}
  opts.cwd = vim.fn.expand(opts.cwd or "~/.cache/vim/session")
  opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)
  local find_command = { "fd", "-t", "f", ".", opts.cwd }
  pickers.new(opts, {
    prompt_title = "Sessions",
    finder = finders.new_oneshot_job(find_command, opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(buf, map)
      actions.select_default:replace(function()
        actions.close(buf)
        local selection = action_state.get_selected_entry()
        vim.cmd("source " .. selection.value)
      end)
      return true
    end,
  }):find()
end

function M.open_session(opts)
  opts = opts or {}
  sessions(themes.get_dropdown(opts))
end

-- setup
function M.setup()
  local map = require("config.utils.map").map

  require("telescope").setup {
    defaults = {
      prompt_prefix = " ",
      file_ignore_patterns = { "__pycache__", "venv" },
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
          ["<esc>"] = actions.close,
          ["<C-/>"] = "which_key",
          ["<M-f>"] = cd,
        },
        n = {
          ["<esc>"] = actions.close,
        },
      },
    },
    pickers = {},
    extensions = {},
  }

  -- telescope repo list: keep opts.cwd
  require("telescope._extensions.repo.list").prepare_command = function(opts)
    local utils = require "telescope._extensions.repo.utils"
    opts = opts or {}
    opts.bin = opts.bin or utils.find_fd_binary()
    if opts.bin == "" then
      error "fd not found, is fd installed?"
    end
    opts.cwd = opts.cwd or vim.env.HOME

    local fd_command = { opts.bin }
    local repo_pattern = opts.pattern or [[^\.git$]]

    local find_repo_opts = { "--hidden", "--case-sensitive", "--absolute-path" }
    local find_user_opts = opts.fd_opts or {}
    local find_exec_opts = { "--exec", "echo", [[{//}]], ";" }
    local find_pattern_opts = { repo_pattern }

    table.insert(fd_command, find_repo_opts)
    table.insert(fd_command, find_user_opts)
    table.insert(fd_command, find_exec_opts)
    table.insert(fd_command, find_pattern_opts)
    fd_command = vim.tbl_flatten(fd_command)

    return fd_command
  end

  -- load extensions
  for _, ext in ipairs { "file_browser", "repo", "fzf" } do
    require("telescope").load_extension(ext)
  end

  -- mappings
  map("n", "<Leader>tB", "<Cmd>Telescope builtin<CR>")
  map("n", "<Leader>tb", "<Cmd>Telescope buffers<CR>")
  map("n", "<Leader>tC", "<Cmd>Telescope commands<CR>")
  map("n", "<Leader>tc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
  map("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>")
  map("n", "<Leader>tF", "<Cmd>Telescope file_browser<CR>")
  map("n", "<Leader>tg", "<Cmd>Telescope git_files<CR>")
  map("n", "<Leader>th", "<Cmd>Telescope help_tags<CR>")
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
    map("n", "<Leader>t2", "<Cmd>lua require'telescope'.extensions.repo.list {cwd='f:/devel'}<CR>")
    map("n", "<Leader>t3", "<Cmd>lua require'telescope'.extensions.repo.list {cwd='f:/devel/py'}<CR>")
    map("n", "<Leader>t4", "<Cmd>lua require'telescope'.extensions.repo.list {cwd='d:/msys64/home/Dieter'}<CR>")
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

  map("n", "<Leader>ss", "<Cmd>lua require'config.plugins.telescope'.open_session()<CR>")
end

return M
