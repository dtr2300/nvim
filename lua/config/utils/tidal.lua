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

  if vim.fn.getline(b_line) == "" then
    return
  end

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
  lines = vim.tbl_map(function(line)
    return line:gsub("^%s+", ""):gsub("%s+$", "")
  end, lines)

  -- strip lines with only comments
  lines = vim.tbl_filter(function(line)
    return line:find "^%-%-" == nil
  end, lines)

  -- send
  exec(table.concat(lines, " "), terminal_id, nil, nil, nil, nil, false)

  -- flash
  local ns = vim.api.nvim_create_namespace "tidal_flash"
  vim.highlight.range(0, ns, "SCNvimEval", { startl - 1, 0 }, { endl, 0 }, { inclusive = true })
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  end, 200)
end

return M
