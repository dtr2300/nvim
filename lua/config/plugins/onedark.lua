require("onedark").setup {
  style = "darker",
  transparent = false,
  term_colors = true,
  ending_tildes = false,
  toggle_style_key = "<Leader>cs",
  toggle_style_list = { "cool", "deep", "warm", "warmer", "dark", "darker" },
  code_style = {
    comments = "italic",
    keywords = "none",
    functions = "none",
    strings = "none",
    variables = "none",
  },
  colors = {},
  highlights = {
    FloatBorder = { fg = "$grey", bg = "$bg1" },
    NormalFloat = { fg = "$fg", bg = "$bg1" },
    VertSplit = { fg = "$bg3" },
    --CursorLine = { bg = "$bg_d" },
  },

  diagnostics = {
    darker = true,
    undercurl = true,
    background = true,
  },
}
