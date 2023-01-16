require "config.core.options"
require "config.core.globals"
require "config.core.mappings"
require "config.core.autocmds"

require("lazy").setup("config.plugins", {
  defaults = {
    lazy = true,
  },
  rtp = {
    disabled_plugins = {
      "getscript",
      "getscriptPlugin",
      "gzip",
      "logiPat",
      "rrhelper",
      "tar",
      "tarPlugin",
      "tohtml",
      "vimball",
      "vimballPlugin",
      "zip",
      "zipPlugin",
    },
  },
})

vim.cmd.colorscheme "catppuccin"
