if vim.fn.has "win32" == 0 then
  return
end

-- send current paragraph
vim.keymap.set({ "n", "i" }, "<M-e>", function()
  require("config.utils.tidal").send(1)
end, { silent = true, buffer = true })

-- send current line
vim.keymap.set({ "n", "i" }, "<C-e>", function()
  require("config.utils.tidal").send(1, false)
end, { silent = true, buffer = true })

-- start tidalcycles
vim.keymap.set(
  "n",
  "<F5>",
  [[<Cmd>1TermExec cmd="tidal.bat" size=7 direction=horizontal<CR>]],
  { silent = true, buffer = true }
)

-- stop tidalcycles
vim.keymap.set(
  "n",
  "<F6>",
  [[<Cmd>1TermExec cmd=""<CR><Cmd>1TermExec cmd="exit"<CR>]],
  { silent = true, buffer = true }
)

-- silence please
vim.keymap.set("n", "<F12>", [[<Cmd>1TermExec cmd="hush" open=0<CR>]], { silent = true, buffer = true })
vim.keymap.set("n", "<S-F12>", [[<Cmd>1TermExec cmd="panic" open=0<CR>]], { silent = true, buffer = true })

-- mutes
for i = 1, 9 do
  vim.keymap.set(
    "n",
    string.format("<Leader>m%d", i),
    string.format([[<Cmd>1TermExec cmd="d%d $ silence" open=0<CR>]], i),
    { silent = true, buffer = true }
  )
end
