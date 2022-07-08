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

-- silence please
vim.keymap.set("n", "<F12>", [[<Cmd>1TermExec cmd="hush" open=0<CR>]], { silent = true, buffer = true })

-- mutes
for i = 1, 8 do
  vim.keymap.set(
    "n",
    string.format("<Leader>m%d", i),
    string.format([[<Cmd>1TermExec cmd="d%d $ silence" open=0<CR>]], i),
    { silent = true, buffer = true }
  )
end
