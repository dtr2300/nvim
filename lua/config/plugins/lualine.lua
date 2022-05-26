local cs = vim.g.colors_name or vim.env.NVIM_COLORSCHEME or "onedark"

require("lualine").setup {
  options = {
    theme = cs,
    globalstatus = true,
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        max_length = function()
          return vim.o.columns - 3
        end,
        symbols = {
          alternate_file = "",
        },
      },
    },
    lualine_z = { "tabs" },
  },
  extensions = { "quickfix" },
}
