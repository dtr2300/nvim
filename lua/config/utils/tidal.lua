M = {}

local exec = require("toggleterm").exec

local function getline(row)
  return vim.fn.getline(row):gsub("^%s+", "")
end

function M.send(terminal_id, send_paragraph)
  vim.validate {
    terminal_id = { terminal_id, "number", true },
    send_paragraph = { send_paragraph, "boolean", true },
  }
  terminal_id = terminal_id or 1
  send_paragraph = send_paragraph == nil or send_paragraph

  local startl, _ = unpack(vim.api.nvim_win_get_cursor(0))
  local lines = getline(startl)
  if lines == "" then
    return
  end
  lines = { lines }
  local endl = startl

  -- find start and end of paragraph
  if send_paragraph then
    local line
    repeat
      line = getline(startl - 1)
      if line ~= "" then
        table.insert(lines, 1, line)
        startl = startl - 1
      end
    until line == ""
    repeat
      line = getline(endl + 1)
      if line ~= "" then
        table.insert(lines, line)
        endl = endl + 1
      end
    until line == ""
  end

  -- strip whitespace and comments
  lines = vim.tbl_map(function(line)
    return line:gsub("%-%-.+$", ""):gsub("%s+$", "")
  end, lines)

  -- remove empty lines
  lines = vim.tbl_filter(function(line)
    return line ~= ""
  end, lines)

  if #lines == 0 then
    return
  end

  -- send
  exec(table.concat(lines, " "), terminal_id, nil, nil, nil, nil, false)

  -- flash
  local ns = vim.api.nvim_create_namespace "tidal_flash"
  vim.highlight.range(0, ns, "SCNvimEval", { startl - 1, 0 }, { endl - 1, 100000 }, { inclusive = true })
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  end, 200)
end

return M
