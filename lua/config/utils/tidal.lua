M = {}

local exec = require("toggleterm").exec

function M.send(terminal_id, send_paragraph)
  vim.validate {
    terminal_id = { terminal_id, "number", true },
    send_paragraph = { send_paragraph, "boolean", true },
  }
  terminal_id = terminal_id or 1
  terminal_id = tonumber(terminal_id)
  send_paragraph = send_paragraph == nil or send_paragraph

  local b_line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local startl = b_line
  local endl = b_line

  -- find paragraph
  if send_paragraph then
    while vim.fn.getline(startl - 1) ~= "" do
      startl = startl - 1
    end
    while vim.fn.getline(endl + 1) ~= "" do
      endl = endl + 1
    end
  end

  local lines = vim.fn.getline(startl, endl)

  if #lines == 0 or lines == nil then
    return
  end

  -- strip whitespace
  for i, v in ipairs(lines) do
    lines[i] = v:gsub("^%s+", ""):gsub("%s+$", "")
  end

  -- strip lines with only comments
  lines = vim.tbl_filter(function(value)
    return value:find "^%-%-" == nil
  end, lines)

  -- TODO: strip inline comments

  -- TODO: flash (?)

  exec(table.concat(lines, " "), terminal_id, nil, nil, nil, nil, false)
end

return M
