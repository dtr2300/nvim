M = {}

local exec = require("toggleterm").exec

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

-- flash range of lines
---@param start_row number
---@param end_row number
local function flash(start_row, end_row)
  local ns = vim.api.nvim_create_namespace "tidal_flash"
  vim.highlight.range(0, ns, "SCNvimEval", { start_row - 1, 0 }, { end_row - 1, 100000 }, { inclusive = true })
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  end, 200)
end

-- collect lines by searching forward or backward in the paragraph
---@param lines table<number, string>
---@param start number
---@param step number
---@return table<number, string>, number
local function getlines(lines, start, step)
  local line
  local sline
  repeat
    line = getline(start + step)
    if line ~= "" then
      sline = strip(line)
      if sline ~= "" then
        if step > 0 then
          table.insert(lines, sline)
        else
          table.insert(lines, 1, sline)
        end
      end
      start = start + step
    end
  until line == ""
  return lines, start
end

-- send a line or paragraph in the current buffer to a terminal
---@param terminal_id? number
---@param send_paragraph? boolean
function M.send(terminal_id, send_paragraph)
  vim.validate {
    terminal_id = { terminal_id, "number", true },
    send_paragraph = { send_paragraph, "boolean", true },
  }
  terminal_id = terminal_id or 1
  send_paragraph = send_paragraph == nil or send_paragraph

  -- get the first line
  local startl, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local line = getline(startl)
  if line == "" then
    return
  end
  line = strip(line)
  local lines = line ~= "" and { line } or {}
  local endl = startl

  -- get rest of the paragraph
  if send_paragraph then
    lines, startl = getlines(lines, startl, -1)
    lines, endl = getlines(lines, endl, 1)
  end

  -- anything left?
  if #lines == 0 then
    return
  end

  -- send
  exec(table.concat(lines, " "), terminal_id, nil, nil, nil, nil, false)

  -- flash
  flash(startl, endl)
end

return M
