M = {}

local exec = require("toggleterm").exec

local terminal_id = 1
local show_output = false

-- get line, strip whitespace at the beginning
---@param row number
---@return string
local function getline(row)
  return vim.fn.getline(row):gsub("^%s+", "")
end

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
  local sline
  repeat
    line = getline(row + step)
    if line ~= "" then
      sline = strip(line)
      if sline ~= "" then
        if step > 0 then
          table.insert(lines, sline)
        else
          table.insert(lines, 1, sline)
        end
      end
      row = row + step
    end
  until line == ""
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

-- start terminal and tidalcycles
function M.start()
  exec("tidal.bat", terminal_id, 7, nil, "horizontal", true, true)
end

-- stop tidalcycles and terminal
function M.stop()
  exec(":quit", terminal_id, nil, nil, nil, false, true)
  vim.defer_fn(function()
    exec("exit", terminal_id, nil, nil, nil, false, true)
  end, 50)
end

-- toggle show output
function M.toggle_output()
  show_output = not show_output
end

-- send a string
---@param s string
function M.send(s)
  vim.validate {
    s = { s, "string", false },
  }
  exec(s, terminal_id, nil, nil, nil, false, show_output)
end

-- send a line or paragraph in the current buffer
-- * multiple lines in a paragraph are concatenated
-- * line(s) are stripped of comments and leading/trailing whitespace
---@param send_paragraph? boolean
function M.send_buf(send_paragraph)
  vim.validate {
    send_paragraph = { send_paragraph, "boolean", true },
  }
  send_paragraph = send_paragraph == nil or send_paragraph

  -- get the first line
  local start_row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line = getline(start_row)
  if line == "" then
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
  exec(table.concat(lines, " "), terminal_id, nil, nil, nil, false, show_output)

  -- flash
  vim.schedule(function()
    flash(start_row, end_row)
  end)
end

return M
