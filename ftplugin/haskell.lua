vim.bo.tabstop = 2
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
vim.bo.cindent = true
vim.opt_local.cinkeys:remove "0#"

-- jump to prev/next paragraph
vim.keymap.set("n", "}", "2}{j", { silent = true, buffer = true })
vim.keymap.set("n", "{", "2{j", { silent = true, buffer = true })

if vim.fn.has "win32" == 0 then
  return
end

local tidal = require "config.utils.tidal"
local strtobool = setmetatable({ ["true"] = true, ["1"] = true, ["false"] = false, ["0"] = false }, {
  __index = function()
    return true -- default: true
  end,
})

-- mappings

-- toggle sc post window
vim.keymap.set("n", "<CR>", function()
  require("scnvim.postwin").toggle()
end, { silent = true, buffer = true, desc = "Toggle sc post window" })

-- start sc and superdirt
vim.keymap.set("n", "<S-F5>", function()
  tidal.start_superdirt()
end, { silent = true, buffer = true, desc = "Start sc and superdirt" })

-- start tidalcycles
vim.keymap.set("n", "<F5>", function()
  tidal.start()
end, { silent = true, buffer = true, desc = "Start tidalcycles" })

-- stop tidalcycles and sc
vim.keymap.set("n", "<F6>", function()
  tidal.stop()
end, { silent = true, buffer = true, desc = "Stop tidalcycles" })

-- send current paragraph
vim.keymap.set({ "n", "i" }, "<M-e>", function()
  tidal.send_buf()
end, { silent = true, buffer = true, desc = "Send paragraph" })

-- send current line
vim.keymap.set({ "n", "i" }, "<C-e>", function()
  tidal.send_buf(false)
end, { silent = true, buffer = true, desc = "Send line" })

-- silence please
vim.keymap.set("n", "<F12>", function()
  tidal.send "hush"
end, { silent = true, buffer = true, desc = "Hush" })

-- panic
vim.keymap.set("n", "<S-F12>", function()
  tidal.send "panic"
end, { silent = true, buffer = true, desc = "Panic" })

-- silence pattern
vim.keymap.set("n", "<LocalLeader>x", function()
  local i = vim.api.nvim_get_vvar "count1"
  if i <= 16 then
    tidal.send(string.format("d%d silence", i))
  end
end, { silent = true, buffer = true, desc = "Silence pattern" })

-- mute pattern
vim.keymap.set("n", "<LocalLeader>m", function()
  local i = vim.api.nvim_get_vvar "count1"
  if i <= 16 then
    tidal.send(string.format("mute %d", i))
  end
end, { silent = true, buffer = true, desc = "Mute pattern" })

-- unmute pattern
vim.keymap.set("n", "<LocalLeader>M", function()
  local i = vim.api.nvim_get_vvar "count1"
  if i <= 16 then
    tidal.send(string.format("unmute %d", i))
  else
    tidal.send "unmuteAll"
  end
end, { silent = true, buffer = true, desc = "Unmute pattern" })

-- solo pattern
vim.keymap.set("n", "<LocalLeader>s", function()
  local i = vim.api.nvim_get_vvar "count1"
  if i <= 16 then
    tidal.send(string.format("solo %d", i))
  end
end, { silent = true, buffer = true, desc = "Solo pattern" })

-- unsolo pattern
vim.keymap.set("n", "<LocalLeader>S", function()
  local i = vim.api.nvim_get_vvar "count1"
  if i <= 16 then
    tidal.send(string.format("unsolo %d", i))
  else
    tidal.send "unsoloAll"
  end
end, { silent = true, buffer = true, desc = "Unsolo pattern" })

-- commands

-- send string
vim.api.nvim_create_user_command("TidalSend", function(opts)
  tidal.send(opts.args)
end, { nargs = 1, desc = "Send string", force = false })

-- start tidalcycles
vim.api.nvim_create_user_command("TidalStartSuperDirt", function()
  tidal.start_superdirt()
end, { nargs = 0, desc = "Start superdirt", force = false })

-- start tidalcycles
vim.api.nvim_create_user_command("TidalStart", function(opts)
  tidal.start(strtobool[opts.fargs[1]], strtobool[opts.fargs[2]], strtobool[opts.fargs[3]])
end, { nargs = "*", desc = "Start tidalcycles", force = false })

-- stop tidalcycles
vim.api.nvim_create_user_command("TidalStop", function(opts)
  tidal.stop(strtobool[opts.fargs[1]])
end, { nargs = "?", desc = "Stop tidalcycles and sc", force = false })
