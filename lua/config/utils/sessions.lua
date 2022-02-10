M = {}

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local make_entry = require "telescope.make_entry"
local themes = require "telescope.themes"

local session_dir = "~/.cache/vim/session"

function M.info()
  local this_session = vim.api.nvim_eval "v:this_session"
  this_session = vim.fn.fnamemodify(this_session, ":p:t:r")
  local cwd = vim.loop.cwd()
  vim.notify(string.format("session: %s\ncwd:     %s", this_session, cwd), 2, { title = "info" })
end

function M.open_session()
  local sessions = function(opts)
    opts = opts or {}
    opts.cwd = vim.fn.expand(opts.cwd or session_dir)
    opts.entry_maker = opts.entry_maker or make_entry.gen_from_file(opts)
    local find_command = { "fd", "-t", "f", "-H", "\\.vim$", opts.cwd }
    pickers.new(opts, {
      prompt_title = "Open Session",
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
  sessions(themes.get_dropdown {})
end

function M.save_session()
  -- TODO: improve this
  local this_session = vim.api.nvim_eval "v:this_session"
  if this_session == "" then
    vim.fn.inputsave()
    this_session = vim.fn.input "Session name: "
    vim.fn.inputrestore()
    vim.cmd("mks " .. vim.fn.expand(session_dir) .. "/" .. this_session .. ".vim")
  else
    vim.cmd("mks! " .. this_session)
  end
  vim.notify "session saved"
end

return M
