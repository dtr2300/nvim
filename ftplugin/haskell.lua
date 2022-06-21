if vim.fn.has "win32" == 0 then
  return
end

vim.keymap.set({ "n", "i" }, "<C-e>", "<Cmd>ToggleTermSendCurrentLine 1<CR>", { silent = true, buffer = true })
vim.keymap.set(
  "n",
  "<F5>",
  [[<Cmd>1TermExec cmd="tidal.bat" size=10 direction=horizontal<CR>]],
  { silent = true, buffer = true }
)
vim.keymap.set(
  "n",
  "<F12>",
  [[<Cmd>1TermExec cmd="hush" open=0<CR>]],
  { silent = true, buffer = true }
)
