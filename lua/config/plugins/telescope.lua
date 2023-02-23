return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    init = function()
      local notes_dir = vim.fn.has "win32" == 1 and "~/Documents/Notes/notes" or "~/Notes/notes"

      vim.keymap.set("n", "<Leader>ta", "<Cmd>Telescope git_status<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tA", "<Cmd>Telescope aerial<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tB", function()
        require("telescope.builtin").builtin { include_extensions = true }
      end, { silent = true, desc = "Telescope builtin (include extensions)" })
      vim.keymap.set("n", "<Leader>tb", "<Cmd>Telescope buffers<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tC", "<Cmd>Telescope commands<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tf", "<Cmd>Telescope find_files<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tF", "<Cmd>Telescope file_browser<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tg", "<Cmd>Telescope git_files<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tG", "<Cmd>Telescope grep_string<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>th", "<Cmd>Telescope help_tags<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tH", "<Cmd>Telescope highlights<CR>", { silent = true })
      vim.keymap.set("n", "<F1>", "<Cmd>Telescope help_tags<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>ti", "<Cmd>Telescope git_commits<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tj", "<Cmd>Telescope jumplist<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tk", "<Cmd>Telescope keymaps<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tl", "<Cmd>Telescope live_grep<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tL", "<Cmd>Telescope luasnip<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tm", "<Cmd>Telescope marks<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tn", function()
        require("telescope.builtin").find_files { cwd = vim.fn.expand(notes_dir) }
      end, { silent = true, desc = "Open note" })
      vim.keymap.set("n", "<Leader>tN", function()
        require("telescope").extensions.file_browser.file_browser { path = vim.fn.expand(notes_dir) }
      end, { silent = true, desc = "Open note (filebrowser)" })
      vim.keymap.set("n", "<Leader>to", "<Cmd>Telescope oldfiles<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tp", "<Cmd>Telescope pickers<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tP", "<Cmd>Telescope lazy<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tq", "<Cmd>Telescope quickfix<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>t1", "<Cmd>Telescope repo list<CR>", { silent = true })
      if vim.fn.has "win32" == 1 then
        vim.keymap.set("n", "<Leader>t2", function()
          require("telescope").extensions.repo.list { search_dirs = { "f:/devel" } }
        end, { silent = true, desc = "Telescope repo list" })
        vim.keymap.set("n", "<Leader>t3", function()
          require("telescope").extensions.repo.list { search_dirs = { "f:/devel/py" } }
        end, { silent = true, desc = "Telescope repo list" })
        vim.keymap.set("n", "<Leader>t4", function()
          require("telescope").extensions.repo.list { search_dirs = { "d:/msys64/home/Dieter" } }
        end, { silent = true, desc = "Telescope repo list" })
      end
      vim.keymap.set("n", "<Leader>tR", "<Cmd>Telescope registers<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tr", "<Cmd>Telescope resume<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>ts", function()
        require("config.utils.sessions").open_session()
      end, { silent = true, desc = "Open session" })
      vim.keymap.set("n", "<Leader>tS", function()
        require("config.utils.sessions").save_session()
      end, { silent = true, desc = "Save session" })
      vim.keymap.set("n", "<Leader>tt", "<Cmd>Telescope treesitter<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tv", "<Cmd>Telescope vim_options<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>ty", "<Cmd>Noice telescope<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>tY", function()
        require("telescope").extensions.notify.notify()
      end, { silent = true, desc = "Telescope notify" })

      vim.keymap.set("n", "<Leader>Td", "<Cmd>Telescope lsp_definitions<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>Tx", "<Cmd>Telescope diagnostics<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>TD", "<Cmd>Telescope lsp_document_symbols<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>Ty", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>Ti", "<Cmd>Telescope lsp_implementations<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>Tr", "<Cmd>Telescope lsp_references<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>Tt", "<Cmd>Telescope lsp_type_definitions<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>Tw", "<Cmd>Telescope lsp_workspace_symbols<CR>", { silent = true })
    end,
    config = function()
      local actions = require "telescope.actions"
      local actions_state = require "telescope.actions.state"
      local actions_layout = require "telescope.actions.layout"

      -- change dir attach mapping
      local function cd(buf)
        actions.close(buf)
        local selection = actions_state.get_selected_entry()
        local cwd = vim.fn.fnamemodify(selection.value, ":p:h")
        vim.cmd("silent lcd " .. cwd)
        require("config.utils.sessions").info()
      end

      -- setup
      require("telescope").setup {
        defaults = {
          prompt_prefix = " ",
          file_ignore_patterns = { "__pycache__", "venv" },
          -- border = false,
          -- wrap_results = true,
          layout_config = {
            horizontal = {
              width = { padding = 0 },
              height = { padding = 0 },
              preview_width = 0.5,
              preview_cutoff = 20,
            },
          },
          mappings = {
            i = {
              ["<Esc>"] = actions.close,
              ["<C-/>"] = "which_key",
              ["<M-f>"] = cd,
              ["<C-p>"] = actions_layout.toggle_preview,
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
      local extensions = { "fzf", "file_browser", "repo", "luasnip", "aerial", "lazy" }

      for _, ext in ipairs(extensions) do
        require("telescope").load_extension(ext)
      end
    end,
    cmd = "Telescope",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    "cljoly/telescope-repo.nvim",
  },
  {
    "tsakirist/telescope-lazy.nvim",
  },
  {
    "benfowler/telescope-luasnip.nvim",
  },
}
