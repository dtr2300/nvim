local cmd = [[<Cmd>tabe %<Bar>term echo]]
  .. (vim.fn.has "win32" == 1 and [[.]] or [[ ""]])
  .. [[ | fzf --phony --print-query --preview-window="up:90\%" --preview "jq ]]
  .. (vim.fn.has "win32" == 1 and "" or [[--color-output ]])
  .. [[{q} \"%\""<CR><Cmd>setlocal nonu nornu<CR>i]]

-- live jq preview
vim.keymap.set("n", "<F2>", cmd, { silent = true, buffer = true })
