-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require "config.core.options"
require "config.core.globals"
require "config.core.mappings"
require "config.core.autocmds"

require("lazy").setup("config.plugins", {
  defaults = {
    lazy = true,
  },
  performance = {
    rtp = {
      reset = false,
      disabled_plugins = {
        "gzip",
        "matchit",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.cmd.colorscheme "catppuccin"
