return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  init = function()
    vim.keymap.set("n", "<Leader>zz", "<Cmd>ZenMode<CR>", { silent = true })
    vim.keymap.set("n", "<Leader>zZ", function()
      require("zen-mode").toggle { window = { width = 0.5 } }
    end, { silent = true, desc = "Toggle ZenMode (width=0.5)" })
  end,
  opts = {
    window = {
      backdrop = 1,
      width = 0.7,
      -- height = 0.95,
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
  },
}
