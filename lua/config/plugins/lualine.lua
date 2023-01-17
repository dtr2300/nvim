return {
  "nvim-lualine/lualine.nvim",
  event = "ColorScheme",
  opts = {
    options = {
      theme = "catppuccin",
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
    extensions = { "quickfix", "toggleterm", "aerial" },
  },
}
