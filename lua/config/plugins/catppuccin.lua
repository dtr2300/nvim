vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup {
  transparent_background = false,
  term_colors = true,
  styles = {
    comments = "italic",
    conditionals = "bold",
    loops = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
    numbers = "NONE",
    booleans = "NONE",
    properties = "NONE",
    types = "NONE",
    operators = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = false,
    telescope = true,
    nvimtree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    which_key = true,
    indent_blankline = {
      enabled = false,
      colored_indent_levels = false,
    },
    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = false,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    hop = false,
    notify = true,
    telekasten = false,
    symbols_outline = false,
  },
}

-- dirty patch for old catppuccin colors
require("catppuccin.core.palettes.init").get_palette = function()
  local mocha = require("catppuccin.core.palettes.mocha")
  mocha.mauve = "#DDB6F2"
  mocha.red = "#F28FAD"
  mocha.maroon = "#E8A2AF"
  mocha.peach = "#F8BD96"
  mocha.yellow = "#FAE3B0"
  mocha.green = "#ABE9B3"
  mocha.teal = "#B5E8E0"
  mocha.sky = "#89DCEB"
  mocha.blue = "#96CDFB"
  mocha.lavender = "#C9CBFF"
  return mocha
end

local c = require("catppuccin.api.colors").get_colors()

require("catppuccin").remap {
  -- closer to old catppuccin
  TSKeyword = { fg = c.red, style = "NONE" },
  TSField = { fg = c.lavender, style = "NONE" },
  TSComment = {fg = c.overlay0, style = "italic" },
  -- alpha
  AlphaButton = { fg = c.blue },
  AlphaButtonShortcut = { fg = c.peach },
  AlphaCol1 = { fg = c.red },
  AlphaCol2 = { fg = c.rosewater },
  AlphaCol3 = { fg = c.yellow },
  AlphaCol4 = { fg = c.green },
  AlphaCol5 = { fg = c.sky },
  AlphaQuote = { fg = c.lavender, style = "italic" },

  -- scnvim
  SCNvimEval = { fg = c.black0, bg = c.lavender },

  -- luasnip
  LuaSnipChoiceNode = { fg = c.yellow, style = "bold" },
  LuaSnipInsertNode = { fg = c.white, style = "bold" },
}
