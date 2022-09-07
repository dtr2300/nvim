M = {}

local terminal_id = 1
local job_id = nil
local osc = nil
local tidalboot_ghci = [[
:set -XOverloadedStrings
:set prompt ""

import Sound.Tidal.Context

import System.IO (hSetEncoding, stdout, utf8)
hSetEncoding stdout utf8

tidal <- startTidal (superdirtTarget {oLatency = 0.05, oAddress = "127.0.0.1", oPort = 57120}) (defaultConfig {cVerbose = True, cFrameTimespan = 1/20})

:{
let only = (hush >>)
    p = streamReplace tidal
    hush = streamHush tidal
    panic = do hush
               once $ sound "superpanic"
    list = streamList tidal
    mute = streamMute tidal
    unmute = streamUnmute tidal
    unmuteAll = streamUnmuteAll tidal
    unsoloAll = streamUnsoloAll tidal
    solo = streamSolo tidal
    unsolo = streamUnsolo tidal
    once = streamOnce tidal
    first = streamFirst tidal
    asap = once
    nudgeAll = streamNudgeAll tidal
    all = streamAll tidal
    resetCycles = streamResetCycles tidal
    setcps = asap . cps
    getcps = streamGetcps tidal
    getnow = streamGetnow tidal
    xfade i = transition tidal True (Sound.Tidal.Transition.xfadeIn 4) i
    xfadeIn i t = transition tidal True (Sound.Tidal.Transition.xfadeIn t) i
    histpan i t = transition tidal True (Sound.Tidal.Transition.histpan t) i
    wait i t = transition tidal True (Sound.Tidal.Transition.wait t) i
    waitT i f t = transition tidal True (Sound.Tidal.Transition.waitT f t) i
    jump i = transition tidal True (Sound.Tidal.Transition.jump) i
    jumpIn i t = transition tidal True (Sound.Tidal.Transition.jumpIn t) i
    jumpIn' i t = transition tidal True (Sound.Tidal.Transition.jumpIn' t) i
    jumpMod i t = transition tidal True (Sound.Tidal.Transition.jumpMod t) i
    jumpMod' i t p = transition tidal True (Sound.Tidal.Transition.jumpMod' t p) i
    mortal i lifespan release = transition tidal True (Sound.Tidal.Transition.mortal lifespan release) i
    interpolate i = transition tidal True (Sound.Tidal.Transition.interpolate) i
    interpolateIn i t = transition tidal True (Sound.Tidal.Transition.interpolateIn t) i
    clutch i = transition tidal True (Sound.Tidal.Transition.clutch) i
    clutchIn i t = transition tidal True (Sound.Tidal.Transition.clutchIn t) i
    anticipate i = transition tidal True (Sound.Tidal.Transition.anticipate) i
    anticipateIn i t = transition tidal True (Sound.Tidal.Transition.anticipateIn t) i
    forId i t = transition tidal False (Sound.Tidal.Transition.mortalOverlay t) i
    d1 = p 1 . (|< orbit 0)
    d2 = p 2 . (|< orbit 1)
    d3 = p 3 . (|< orbit 2)
    d4 = p 4 . (|< orbit 3)
    d5 = p 5 . (|< orbit 4)
    d6 = p 6 . (|< orbit 5)
    d7 = p 7 . (|< orbit 6)
    d8 = p 8 . (|< orbit 7)
    d9 = p 9 . (|< orbit 8)
    d10 = p 10 . (|< orbit 9)
    d11 = p 11 . (|< orbit 10)
    d12 = p 12 . (|< orbit 11)
    d13 = p 13
    d14 = p 14
    d15 = p 15
    d16 = p 16
:}

:{
let getState = streamGet tidal
    setI = streamSetI tidal
    setF = streamSetF tidal
    setS = streamSetS tidal
    setR = streamSetR tidal
    setB = streamSetB tidal
:}

:{
let drumMachine name ps = stack 
                    (map (\ x -> 
                        (# s (name ++| (extractS "s" (x)))) $ x
                        ) ps)
    drumFrom name drum = s (name ++| drum)
    drumM = drumMachine
    drumF = drumFrom
:}

let bpm x = setcps (x/60/4)

:set prompt "tidal> "
:set prompt-cont ""

default (Pattern String, Integer, Double)
]]

-- test
local oscmap = {
  [36] = [[d1 silence]],
  [37] = [[d1 $ s "cpu*4"]],
  [38] = [[d1 $ s "cpu*8"]],
  [39] = [[d1 $ fast 2 $ s "cpu(<5 3 5 2>,8)"]],
  [40] = function()
    print "test 1234"
  end,
  [41] = { ":{", "do", [[  d1 $ s "bd*4"]], [[  d2 $ s "[~ hh27]*4"]], ":}" },
  [42] = "hush",
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

-- start osc server
local function start_osc()
  osc = require("osc").new {
    transport = "udp",
    recvAddr = "127.0.0.1",
    recvPort = 9000,
  }

  osc:add_handler("/note", function(data)
    local cmd = oscmap[tonumber(data.message[1])]
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

-- stop osc server
local function stop_osc()
  osc:close()
end

-- start terminal and tidalcycles
function M.start()
  if job_id == nil then
    require("toggleterm").exec("ghci", terminal_id, 10, nil, "horizontal", false, true)
    local term = require("toggleterm.terminal").get(terminal_id)
    if term ~= nil then
      job_id = term.job_id
      send(tidalboot_ghci)
      vim.cmd.stopinsert { bang = true }
      vim.cmd.normal { "G", bang = true }
      vim.cmd.wincmd "p"
      start_osc()
    end
  end
end

-- stop tidalcycles and terminal
function M.stop()
  if job_id ~= nil then
    job_id = nil
    stop_osc()
    require("toggleterm").exec(":quit", terminal_id, nil, nil, nil, false, true)
    vim.defer_fn(function()
      require("toggleterm").exec("exit", terminal_id, nil, nil, nil, false, true)
    end, 50)
  end
end

return M
