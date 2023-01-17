return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    require("alpha").setup {
      layout = require "config.plugins.alpha.layout",
      opts = {
        setup = function()
          vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            desc = "Disable status and tabline for alpha",
            callback = function()
              vim.go.laststatus = 0
              vim.opt.showtabline = 0
            end,
          })
          vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            desc = "Enable status and tabline after alpha",
            callback = function()
              vim.go.laststatus = 3
              vim.opt.showtabline = 2
            end,
          })
        end,
        margin = 5,
      },
    }
  end,
}
