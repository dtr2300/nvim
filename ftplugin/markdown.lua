-- preview markdown
vim.keymap.set(
  "n",
  "<F2>",
  '<Cmd>tabe %<Bar>term glow -p "%"<CR><Cmd>setlocal nonu nornu<CR>i',
  { silent = true, buffer = true }
)
