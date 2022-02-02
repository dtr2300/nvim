if vim.fn.has "win32" == 1 then
  -- already handled by scnvim
  return
end

vim.cmd [[
augroup filetype_supercollider
  au!
  au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set ft=supercollider
  au BufEnter,BufWinEnter,BufNewFile,BufRead *.schelp set ft=scdoc
augroup END
]]
