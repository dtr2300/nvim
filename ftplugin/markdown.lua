-- preview markdown
vim.keymap.set(
  "n",
  "<F2>",
  '<Cmd>tabe %<Bar>term glow -p "%"<CR><Cmd>setlocal nonu nornu<CR>i',
  { silent = true, buffer = true }
)

-- set conceallevel to 1
vim.keymap.set("n", "<LocalLeader>c", "<Cmd>setlocal conceallevel=1<CR>", { silent = true, buffer = true })
