if vim.fn.has "win32" == 0 then
  return
end

local tidal = require "config.utils.tidal"

-- toggle show output (on next send)
vim.keymap.set({ "n", "i" }, "<M-r>", function()
  tidal.toggle_output()
end, { silent = true, buffer = true, desc = "Toggle show output" })

-- send current paragraph
vim.keymap.set({ "n", "i" }, "<M-e>", function()
  tidal.send_buf()
end, { silent = true, buffer = true, desc = "Send paragraph" })

-- send current line
vim.keymap.set({ "n", "i" }, "<C-e>", function()
  tidal.send_buf(false)
end, { silent = true, buffer = true, desc = "Send line" })

-- start tidalcycles
vim.keymap.set("n", "<F5>", function()
  tidal.start()
end, { silent = true, buffer = true, desc = "Start tidalcycles" })

-- stop tidalcycles
vim.keymap.set("n", "<F6>", function()
  tidal.stop()
end, { silent = true, buffer = true, desc = "Stop tidalcycles" })

-- silence please
vim.keymap.set("n", "<F12>", function()
  tidal.send "hush"
end, { silent = true, buffer = true, desc = "Hush" })

-- panic
vim.keymap.set("n", "<S-F12>", function()
  tidal.send "panic"
end, { silent = true, buffer = true, desc = "Panic" })

-- mutes
for i = 1, 9 do
  vim.keymap.set("n", string.format("<Leader>m%d", i), function()
    tidal.send(string.format("d%d silence", i))
  end, { silent = true, buffer = true, desc = string.format("Mute d%d", i) })
end
