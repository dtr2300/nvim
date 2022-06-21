-- TODO: use new filetype api
vim.api.nvim_create_augroup("filetype_tidal", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufNewFile", "BufRead" }, {
  group = "filetype_tidal",
  pattern = "*.tidal",
  command = "set ft=haskell",
})
