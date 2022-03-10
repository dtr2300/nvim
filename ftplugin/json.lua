local buf_map = require("config.utils.map").buf_map

-- live jq preview
if vim.fn.has "win32" == 1 then
  buf_map(
    "n",
    "<F2>",
    [[<Cmd>term echo. | fzf --phony --print-query --preview-window="up:90\%" --preview "jq --color-output {q} %"<CR>]]
  )
else
  buf_map(
    "n",
    "<F2>",
    [[<Cmd>term echo '' | fzf --phony --print-query --preview-window='up:90\%' --preview "jq --color-output {q} %"<CR>]]
  )
end
