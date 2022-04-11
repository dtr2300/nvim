M = {}

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"

local function string2table(s)
  local t = {}
  s:gsub("[%w_]+", function(c)
    table.insert(t, c)
  end)
  return t
end

local function scnvim_unpack_tags_table()
  local root = vim.g.scnvim_root_dir
  local classes = root .. "/scnvim-data/tags"
  local tagsfile = io.open(classes)
  local help = {}
  for line in tagsfile:lines() do
    local tagname, tagpath, _, _ = line:match "%s*(.-)\t%s*(.-)\t%s*(.-)\t%s*(.-)"
    help[tostring(tagname)] = tagpath
  end
  return help
end

local function scnvim_help_keys()
  local help = scnvim_unpack_tags_table()
  local help_keys = {}
  for k, _ in pairs(help) do
    table.insert(help_keys, tostring(k))
  end
  return help_keys
end

-- load snippets
function M.load_snippets()
  require("luasnip").add_snippets("supercollider", require("scnvim.utils").get_snippets(), { key = "scnvimsnippets" })
end

-- sc-eval
function M.sc_eval(sc_code, sc_return_code, o)
  require("scnvim").eval(sc_code, function(return_val)
    local sc_eval_picker = function(opts)
      opts = opts or {}
      pickers.new(opts, {
        prompt_title = "sc-eval",
        finder = finders.new_table { results = string2table(return_val) },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if sc_return_code then
              require("scnvim").send(string.format(sc_return_code, selection.value))
            end
          end)
          return true
        end,
      }):find()
    end
    sc_eval_picker(themes.get_dropdown(o))
  end)
end

-- synthdefs
function M.play_synthdef()
  M.sc_eval([[SynthDescLib.default.synthDescs.keys.asArray;]], [[Synth('%s');]], { prompt_title = "Play SynthDef" })
end

-- scales
function M.play_scale()
  M.sc_eval(
    [[Scale.names;]],
    [[~ascale=\%s;Pbind(\scale, Scale.at(~ascale), \degree, Pseq((0..Scale.at(~ascale).degrees.size-1),1), \dur, 0.25).play; Scale.at(~ascale).postln;]],
    { prompt_title = "Play Scale" }
  )
end

-- schelp
M.schelp = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "SC Help",
    finder = finders.new_table { results = scnvim_help_keys() },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.fn["scnvim#help#open_help_for"](selection.value)
      end)
      return true
    end,
  }):find()
end

return M
