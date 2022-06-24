M = {}

local api = vim.api
local fn = vim.fn
local exec = require("toggleterm").exec

function M.send(terminal_id)
  terminal_id = terminal_id or 1
  terminal_id = tonumber(terminal_id)

  vim.validate {
    terminal_id = { terminal_id, "number", true },
  }

  local current_window = api.nvim_get_current_win()
  local b_line, b_col = unpack(api.nvim_win_get_cursor(0))

  local startl = b_line
  for i = b_line, 1, -1 do
    if fn.getline(i) == "" then
      break
    end
    startl = i
  end

  local endl = b_line
  while fn.getline(endl + 1) ~= "" do
    endl = endl + 1
  end

  local lines = fn.getline(startl, endl)

  if #lines == 0 or lines == nil then
    return
  end

  for i, v in ipairs(lines) do
    lines[i] = v:gsub("^%s+", ""):gsub("%s+$", "")
  end

  lines = vim.tbl_filter(function(value)
    if value:find "^%-%-" ~= nil then
      return false
    end
    return true
  end, lines)

  local v = table.concat(lines, " ")

  exec(v, terminal_id)

  api.nvim_set_current_win(current_window)
  api.nvim_win_set_cursor(current_window, { b_line, b_col })
end

return M
