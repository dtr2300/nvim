-- Highlight on yank
vim.cmd [[
augroup yank_hl
  au!
  au TextYankPost * silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=150, on_visual=true}
augroup END
]]

-- Capture command to buffer command
vim.cmd [[
function! Capture(cmd)
  execute ":enew|pu=execute('" . a:cmd . "')|1,2d_"
endfunction
command! -nargs=1 Capture silent call Capture(<f-args>)
]]

-- Terminal
vim.cmd [[
augroup neovim_terminal
  au!
  au TermOpen * setlocal nonumber norelativenumber
  au TermOpen * startinsert
augroup END
]]
