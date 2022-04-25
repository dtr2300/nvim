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

    -- alpha
    AlphaButton = { fg = "$blue" },
    AlphaButtonShortcut = { fg = "$yellow" },
    AlphaCol1 = { fg = "$red" },
    AlphaCol2 = { fg = "$orange" },
    AlphaCol3 = { fg = "$cyan" },
    AlphaCol4 = { fg = "$green" },
    AlphaCol5 = { fg = "$purple" },
    AlphaQuote = { fg = "$light_grey", fmt = "italic" },

    -- scnvim
    SCNvimEval = { fg = "$bg1", bg = "$cyan" },

    -- luasnip
    LuaSnipChoiceNode = { fg = "$yellow", fmt = "bold" },
    LuaSnipInsertNode = { fg = "$light_grey", fmt = "bold" },

    -- ts_rainbow
    rainbowcol1 = { fg = "$red" },
    rainbowcol2 = { fg = "$yellow" },
    rainbowcol3 = { fg = "$orange" },
    rainbowcol4 = { fg = "$green" },
    rainbowcol5 = { fg = "$blue" },
    rainbowcol6 = { fg = "$cyan" },
    rainbowcol7 = { fg = "$purple" },
  },

  diagnostics = {
    darker = true,
    undercurl = true,
    background = true,
  },
}
