return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  init = function()
    -- vim.keymap.set("n", "<Leader>zz", "<Cmd>ZenMode<CR>", { silent = true })
    -- work around, see https://github.com/folke/zen-mode.nvim/issues/69
    -- (also cmdheight = 0 is not an option because of noice.nvim)
    vim.keymap.set("n", "<Leader>zz", "G<C-e><Cmd>ZenMode<CR>gg", { silent = true })
    vim.keymap.set("n", "<Leader>zZ", function()
      vim.cmd.normal { "G<C-e>", bang = true }
      require("zen-mode").toggle { window = { width = 0.5 } }
      vim.cmd.normal { "gg", bang = true }
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
    on_open = function()
      require("lualine").hide()
      vim.opt.laststatus = 0
    end,
    on_close = function()
      vim.opt.laststatus = 3
      require("lualine").hide { unhide = true }
    end,
  },
}
