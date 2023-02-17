-- capture vim command to buffer
vim.cmd [[
function! Capture(cmd)
  execute ":enew|pu=execute('" . a:cmd . "')|1,2d_"
endfunction
command! -nargs=1 Capture silent call Capture(<f-args>)
]]
