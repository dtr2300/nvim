if vim.fn.has "win32" == 0 then
  return
end

-- open sc help
vim.keymap.set("n", "<S-F1>", function()
  require("config.utils.sc").schelp(require("telescope.themes").get_dropdown())
end, { silent = true, buffer = true, desc = "Open SCHelp" })

-- open the help source file for the classname under the cursor
vim.keymap.set("n", "<C-F1>", function()
  local subject = vim.fn.expand "<cword>"
  local cmd = [[SCDoc.helpSourceDir +/+ \"Classes\" +/+ \"%s\" ++ \".schelp\"]]
  cmd = string.format(cmd, subject)
  require("scnvim").eval(cmd, function(result)
    result = string.format("edit %s", result)
    vim.cmd(result)
  end)
end, { silent = true, desc = "Open SCHelp source for the classname under the cursor" })

-- play scale
vim.keymap.set("n", "<F8>", function()
  require("config.utils.sc").play_scale()
end, { silent = true, buffer = true, desc = "Play a scale" })

vim.keymap.set("n", "<F5>", "<Cmd>SCNvimStart<CR>", { silent = true, buffer = true })
vim.keymap.set("n", "<F6>", "<Cmd>SCNvimStop<CR>", { silent = true, buffer = true })
