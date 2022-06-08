local cs = vim.g.colors_name or vim.env.NVIM_COLORSCHEME or "onedark"

require("lualine").setup {
  options = {
    theme = cs,
    globalstatus = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = " ", right = " " },
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
        filetype_names = {
          TelescopePrompt = "Telescope",
          packer = "Packer",
          alpha = "Alpha",
          aerial = "Aerial",
        },
      },
    },
    lualine_z = { "tabs" },
  },
  extensions = { "quickfix", "toggleterm", "aerial" },
}
