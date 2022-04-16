if vim.fn.has "win32" == 1 then
  -- already handled by scnvim
  return
end

-- TODO: use new filetype api
vim.api.nvim_create_augroup("filetype_supercollider", { clear = true})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufNewFile", "BufRead" }, {
  group = "filetype_supercollider",
  pattern = { "*.sc", "*.scd" },
  command = "set ft=supercollider",
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufNewFile", "BufRead" }, {
  group = "filetype_supercollider",
  pattern = "*.schelp",
  command = "set ft=scdoc",
})
