return {
  {
    "folke/which-key.nvim",
    event = "UIEnter",
    opts = {
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
    },
  },
}
