M = {}

function M.send(terminal_id)
  terminal_id = terminal_id or 1
  terminal_id = tonumber(terminal_id)

  vim.validate {
    terminal_id = { terminal_id, "number", true },
  }

  local b_line, _ = unpack(vim.api.nvim_win_get_cursor(0))

  -- find paragraph start
  local startl = b_line
  while vim.fn.getline(startl - 1) ~= "" do
    startl = startl - 1
  end

  -- find paragraph end
  local endl = b_line
  while vim.fn.getline(endl + 1) ~= "" do
    endl = endl + 1
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

  local v = table.concat(lines, " ")

  require("toggleterm").exec(v, terminal_id, nil, nil, nil, nil, false)
end

return M
