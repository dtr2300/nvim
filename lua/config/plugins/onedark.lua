require"onedark".setup {
  style = "darker",
  transparent = false,
  term_colors = true,
  ending_tildes = false,
  toggle_style_key = "<leader>tc",
  toggle_style_list = {"dark", "darker", "cool", "deep", "warm", "warmer", "light"},

  code_style = {
    comments = "italic",
    keywords = "none",
    functions = "none",
    strings = "none",
    variables = "none"
  },

  colors = {},
  highlights = {},

  diagnostics = {
     darker = true,
     undercurl = true,
     background = true,
  },
}
