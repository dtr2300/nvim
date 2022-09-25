M = {}

local boot = require "config.utils.tidal.boot"

local terminal_id = 1
local job_id = nil
local osc = nil

-- map: midi note -> tidal string/list of strings or lua function
local oscmap = {
  [36] = [[d1 $ s "cpu*4"]],
  [40] = "hush",
  [41] = function()
    vim.api.nvim_feedkeys("{", "t", false)
  end,
  [42] = function()
    vim.api.nvim_feedkeys("}", "t", false)
  end,
  [43] = function()
    require("config.utils.tidal").send_buf()
  end,
}

M.oscmap = oscmap

-- strip comments, whitespace at the end
---@param s string
---@return string
local function strip(s)
  s = s:gsub("%-%-.*$", ""):gsub("%s+$", "")
  return s
end

-- collect lines by searching forward or backward in the paragraph
---@param lines table<number, string>
---@param row number
---@param step number
---@return table<number, string>, number
local function getlines(lines, row, step)
  repeat
    local line = vim.fn.getline(row + step)
    local cline = line:gsub("^%s+", "")
    if cline ~= "" then
      line = strip(line)
      if line ~= "" then
        table.insert(lines, step > 0 and #lines + 1 or 1, line)
      end
      row = row + step
    end
  until cline == ""
  return lines, row
end

-- flash range of lines in current buffer
---@param start_row number
---@param end_row number
local function flash(start_row, end_row)
  local ns = vim.api.nvim_create_namespace "tidal_flash"
  vim.highlight.range(0, ns, "TidalEval", { start_row - 1, 0 }, { end_row - 1, 100000 }, { inclusive = true })
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  end, 200)
end

-- send a string or list of strings
---@param obj string|table<number,string>
local function send(obj)
  if job_id == nil then
    return
  end
  vim.validate {
    obj = { obj, { "string", "table" }, false },
  }

  if type(obj) == "string" then
    obj = vim.split(obj, "\n")
  end

  if obj[#obj] ~= "" then
    table.insert(obj, "")
  end

  vim.fn.chansend(job_id, obj)
end

M.send = send

-- send a line or paragraph in the current buffer
-- * trailing comments and whitespace are removed
-- * multiple lines are wrapped in :{ :}
---@param send_paragraph? boolean
function M.send_buf(send_paragraph)
  if job_id == nil then
    return
  end
  vim.validate {
    send_paragraph = { send_paragraph, "boolean", true },
  }
  send_paragraph = send_paragraph == nil or send_paragraph

  -- get the first line
  local start_row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.fn.getline(start_row)
  if line:gsub("^%s+", "") == "" then
    return
  end
  line = strip(line)
  local lines = line ~= "" and { line } or {}
  local end_row = start_row

  -- get rest of the paragraph
  if send_paragraph then
    lines, start_row = getlines(lines, start_row, -1)
    lines, end_row = getlines(lines, end_row, 1)
  end

  -- anything left?
  if #lines == 0 then
    return
  end

  -- wrap
  if #lines > 1 then
    table.insert(lines, 1, ":{")
    table.insert(lines, ":}")
  end

  -- send
  send(lines)

  -- flash
  vim.schedule(function()
    flash(start_row, end_row)
  end)
end

-- start nvim osc server
local function start_osc()
  osc = require("osc").new {
    transport = "udp",
    recvAddr = "127.0.0.1",
    recvPort = 9000,
  }

  osc:add_handler("/note", function(data)
    local cmd = require("config.utils.tidal").oscmap[tonumber(data.message[1])]
    if cmd ~= nil then
      vim.schedule(function()
        if type(cmd) == "function" then
          cmd()
        else
          send(cmd)
        end
      end)
    end
  end)

  osc:open()
end

-- stop nvim osc server
local function stop_osc()
  osc:close()
  osc = nil
end

-- start sc and superdirt
function M.start_superdirt()
  if not require("scnvim.sclang").is_running() then
    require("scnvim.sclang").start()
  end
  vim.defer_fn(function()
    require("scnvim.sclang").send(boot.start_superdirt_scd)
  end, 50)
end

-- start tidalcycles (superdirt must be running)
---@param tidal_midi_in? boolean
---@param nvim_midi_in? boolean
---@param tidal_midi_out? boolean
function M.start(tidal_midi_in, nvim_midi_in, tidal_midi_out)
  vim.validate {
    tidal_midi_in = { tidal_midi_in, "boolean", true },
    nvim_midi_in = { nvim_midi_in, "boolean", true },
    tidal_midi_out = { tidal_midi_out, "boolean", true },
  }
  tidal_midi_in = tidal_midi_in == nil or tidal_midi_in
  nvim_midi_in = nvim_midi_in == nil or nvim_midi_in
  tidal_midi_out = tidal_midi_out == nil or tidal_midi_out

  if job_id == nil then
    require("toggleterm").exec("ghci", terminal_id, 10, nil, "horizontal", false, true)
    local term = require("toggleterm.terminal").get(terminal_id)
    if term ~= nil then
      job_id = term.job_id

      send(boot.tidalboot_ghci)

      vim.cmd.stopinsert { bang = true }
      vim.cmd.normal { "G", bang = true }
      vim.cmd.wincmd "p"

      if nvim_midi_in then
        start_osc()
      end

      if tidal_midi_in or nvim_midi_in or tidal_midi_out then
        require("scnvim.sclang").send(
          string.format(boot.start_midi_scd, tostring(tidal_midi_in), tostring(nvim_midi_in), tostring(tidal_midi_out))
        )
      end
    end
  end
end

-- stop tidalcycles and sc
---@param stop_sclang? boolean
function M.stop(stop_sclang)
  vim.validate {
    stop_sclang = { stop_sclang, "boolean", true },
  }
  stop_sclang = stop_sclang == nil or stop_sclang

  if job_id ~= nil then
    if osc ~= nil then
      require("scnvim.sclang").send "~stopMidiToOsc.value;"
      stop_osc()
    end

    job_id = nil
    require("toggleterm").exec(":quit", terminal_id, nil, nil, nil, false, true)
    vim.defer_fn(function()
      require("toggleterm").exec("exit", terminal_id, nil, nil, nil, false, true)
    end, 50)

    if stop_sclang and require("scnvim.sclang").is_running() then
      require("scnvim.sclang").stop()
    end
  end
end

return M
