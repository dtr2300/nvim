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
