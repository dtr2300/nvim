return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufNewFile", "BufReadPost", "BufWritePost" },
    config = require "config.plugins.lsp.config",
  },
  {
    "ray-x/lsp_signature.nvim",
  },
  {
    "onsails/lspkind-nvim",
  },
}
