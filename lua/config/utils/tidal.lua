M = {}

local terminal_id = 1
local job_id = nil

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
  local line
  local cline
  repeat
    line = vim.fn.getline(row + step)
    cline = line:gsub("^%s+", "")
    if cline ~= "" then
      line = strip(line)
      if line ~= "" then
        if step > 0 then
          table.insert(lines, line)
        else
          table.insert(lines, 1, line)
        end
      end
      row = row + step
    end
  until cline == ""
  return lines, row
end

-- send a string
---@param s string
local function _send(s)
  vim.fn.chansend(job_id, s .. "\n")
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
    _send(obj)
  else
    if #obj == 1 then
      _send(obj[1])
    else
      _send ":{"
      for _, line in ipairs(obj) do
        _send(line)
      end
      _send ":}"
    end
  end
end

M.send = send

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

-- start terminal and tidalcycles
function M.start()
  require("toggleterm").exec("tidal.bat", terminal_id, 10, nil, "horizontal", true, true)
  local term = require("toggleterm.terminal").get(terminal_id)
  job_id = term ~= nil and term.job_id or nil
end

-- stop tidalcycles and terminal
function M.stop()
  job_id = nil
  require("toggleterm").exec(":quit", terminal_id, nil, nil, nil, false, true)
  vim.defer_fn(function()
    require("toggleterm").exec("exit", terminal_id, nil, nil, nil, false, true)
  end, 50)
end

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

  -- send
  send(lines)

  -- flash
  vim.schedule(function()
    flash(start_row, end_row)
  end)
end

return M
