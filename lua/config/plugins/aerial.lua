require("aerial").setup {
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
    "Type",
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", "<F4>", "<Cmd>AerialToggle!<CR>", { silent = true, buffer = bufnr })
    vim.keymap.set("n", "{", "<Cmd>AerialPrev<CR>", { silent = true, buffer = bufnr })
    vim.keymap.set("n", "}", "<Cmd>AerialNext<CR>", { silent = true, buffer = bufnr })
  end,
}
