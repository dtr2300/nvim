return function()
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
end
