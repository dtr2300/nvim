return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    init = require "config.plugins.telescope.mappings",
    config = require "config.plugins.telescope.config",
    cmd = "Telescope",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  {
    "cljoly/telescope-repo.nvim",
  },
  {
    "tsakirist/telescope-lazy.nvim",
  },
  {
    "benfowler/telescope-luasnip.nvim",
  },
}
