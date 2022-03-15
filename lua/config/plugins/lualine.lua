local cs = vim.g.colors_name or vim.env.NVIM_COLORSCHEME or "onedark"

require("lualine").setup {
  options = {
    theme = cs,
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        max_length = function()
          return vim.o.columns - 3
        end,
      },
    },
    lualine_x = {
      function()
        return vim.fn.has "win32" == 1 and "" or ""
      end,
    },
  },
  extensions = { "quickfix" },
}
