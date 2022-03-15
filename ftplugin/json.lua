local buf_map = require("config.utils.map").buf_map

local cmd_win =
  [[<Cmd>term echo. | fzf --phony --print-query --preview-window="up:90\%" --preview "jq --color-output {q} \"%\""<CR>]]
local cmd_unix =
  [[<Cmd>term echo '' | fzf --phony --print-query --preview-window='up:90\%' --preview 'jq --color-output {q} "%"'<CR>]]

-- live jq preview
buf_map("n", "<F2>", vim.fn.has "win32" == 1 and cmd_win or cmd_unix)
