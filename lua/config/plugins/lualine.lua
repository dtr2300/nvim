local cs = vim.g.colors_name or vim.env.NVIM_COLORSCHEME or "onedark"

require("lualine").setup {
  options = {
    theme = cs,
    globalstatus = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        separator = { left = "", right = "" },
      },
    },
    lualine_b = {
      {
        "branch",
        separator = { left = "", right = "" },
      },
      {
        "diff",
        separator = { left = "", right = "" },
      },
      {
        "diagnostics",
        separator = { left = "", right = "" },
      },
    },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = {
      {
        "progress",
        separator = { left = "" },
      },
    },
    lualine_z = {
      {
        "location",
        separator = { left = "", right = "" },
      },
    },
  },
  -- tabline = {
  --   lualine_a = {
  --     {
  --       "buffers",
  --       separator = { left = "", right = "" },
  --       max_length = function()
  --         return vim.o.columns - 3
  --       end,
  --       symbols = {
  --         alternate_file = "",
  --       },
  --       filetype_names = {
  --         TelescopePrompt = "Telescope",
  --         packer = "Packer",
  --         alpha = "Alpha",
  --         aerial = "Aerial",
  --       },
  --     },
  --   },
  --   lualine_z = {
  --     {
  --       "tabs",
  --       separator = { left = "", right = "" },
  --     }
  --   },
  -- },
  extensions = { "quickfix", "toggleterm", "aerial" },
}
