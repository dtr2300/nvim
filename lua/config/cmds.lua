local cmds = {
-- set colorscheme
"colorscheme onedark",

-- highlight on yank
[[
augroup yank_hl
  au!
  au TextYankPost * silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=150, on_visual=true}
augroup END
]],

-- capture command to buffer command
[[
function! Capture(cmd)
  execute ":enew|pu=execute('" . a:cmd . "')|1,2d_"
endfunction
command! -nargs=1 Capture silent call Capture(<f-args>)
]],

-- terminal
[[
augroup neovim_terminal
  au!
  au TermOpen * setlocal nonumber norelativenumber
  au TermOpen * startinsert
augroup END
]],
}

-- set interface language
if vim.fn.has("win32") == 1 then
  table.insert(cmds, "lang messages en_GB")
end

vim.cmd(table.concat(cmds, "\n"))
