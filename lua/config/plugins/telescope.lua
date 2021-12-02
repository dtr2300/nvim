local M = {}

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

function M.setup()
  local map = require"config.utils.map".map

  require"telescope".setup {
    defaults = {
      prompt_prefix = ' ',
      file_ignore_patterns = {"__pycache__", "venv"},
      mappings = {
        i = {
          ["<esc>"] = require"telescope.actions".close,
        },
        n = {
          ["<esc>"] = require"telescope.actions".close,
        },
      },
    },
    pickers = {
      current_buffer_fuzzy_find = {
        theme = "ivy",
      },
      find_files = {
        theme = "ivy",
      },
      live_grep = {
        theme = "ivy",
      },
      oldfiles = {
        theme = "ivy",
      },
    },
  }

  map("n", "<Leader>fb", "<Cmd>Telescope marks<CR>")
  map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>")
  map("n", "<Leader>fh", "<Cmd>Telescope oldfiles<CR>")
  map("n", "<Leader>fa", "<Cmd>Telescope live_grep<CR>")
  map("n", "<Leader>fT", "<Cmd>Telescope treesitter<CR>")
  map("n", "<Leader>fB", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
  map("n", "<Leader>fC", "<Cmd>Telescope commands<CR>")
  map("n", "<Leader>fF", "<Cmd>Telescope file_browser<CR>")
  map("n", "<Leader>fH", "<Cmd>Telescope help_tags<CR>")
  map("n", "<Leader>sl", "<Cmd>lua require'config.plugins.telescope'.list_sessions()<CR>")
end

return M
