require("onedark").setup {
  style = "darker",
  transparent = false,
  term_colors = true,
  ending_tildes = false,
  toggle_style_key = "<Leader>cX", -- <Leader>cs : see tablineframework.lua
  toggle_style_list = { "cool", "deep", "warm", "warmer", "dark", "darker" },

  code_style = {
    comments = "italic",
    keywords = "none",
    functions = "none",
    strings = "none",
    variables = "none",
  },

  colors = {},
  highlights = {},

  diagnostics = {
    darker = true,
    undercurl = true,
    background = true,
  },
}
