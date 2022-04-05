if vim.fn.has "win32" == 0 then
  return
end

vim.keymap.set("n", "<S-F1>", function()
  require("config.utils.sc").schelp(require("telescope.themes").get_dropdown())
end, { silent = true, buffer = true })
vim.keymap.set("n", "<F8>", function()
  require("config.utils.sc").play_scale()
end, { silent = true, buffer = true })
vim.keymap.set("n", "<F5>", "<Cmd>SCNvimStart<CR>", { silent = true, buffer = true })
vim.keymap.set("n", "<F6>", "<Cmd>SCNvimStop<CR>", { silent = true, buffer = true })
