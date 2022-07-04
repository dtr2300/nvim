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

return M
