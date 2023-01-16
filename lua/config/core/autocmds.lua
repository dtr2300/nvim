-- highlight on yank
vim.api.nvim_create_augroup("yank_hl", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "yank_hl",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150, on_visual = true }
  end,
})
