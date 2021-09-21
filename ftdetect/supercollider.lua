if jit.os == "Windows" then
  return
end

vim.cmd [[
augroup filetype_supercollider
  au!
  au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set ft=supercollider
  au BufEnter,BufWinEnter,BufNewFile,BufRead *.schelp set ft=scdoc
augroup END
]]
