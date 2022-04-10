require("zen-mode").setup {
  window = {
    backdrop = 1,
    width = 0.7,
    height = 1,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false,
      foldcolumn = "0",
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
  },
  on_open = function(win)
    vim.cmd "mode"
  end,
}

vim.keymap.set("n", "<Leader>zz", "<Cmd>ZenMode<CR>", { silent = true })
