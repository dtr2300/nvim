-- update lualine colors
vim.api.nvim_create_augroup("update_lualine", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "update_lualine",
  callback = function()
    R "config.plugins.lualine"
  end,
})

-- highlight on yank
vim.api.nvim_create_augroup("yank_hl", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "yank_hl",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150, on_visual = true }
  end,
})

-- terminal
vim.api.nvim_create_augroup("neovim_terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = "neovim_terminal",
  command = "setlocal nonumber norelativenumber",
})
vim.api.nvim_create_autocmd("TermOpen", {
  group = "neovim_terminal",
  command = "startinsert",
})

local cmds = {

  -- capture command to buffer command
  [[
  function! Capture(cmd)
    execute ":enew|pu=execute('" . a:cmd . "')|1,2d_"
  endfunction
  command! -nargs=1 Capture silent call Capture(<f-args>)
  ]],

  -- set colorscheme
  "colorscheme " .. (vim.env.NVIM_COLORSCHEME or "onedark"),
}

-- set interface language
if vim.fn.has "win32" == 1 then
  table.insert(cmds, "lang messages en_GB")
end

vim.cmd(table.concat(cmds, "\n"))
