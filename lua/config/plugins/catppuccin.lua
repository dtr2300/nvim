vim.g.catppuccin_flavour = "mocha"

-- old catppuccin colors
-- require("catppuccin.core.palettes.init").get_palette = function()
--   return {
--     rosewater = "#F5E0DC",
--     flamingo = "#F2CDCD",
--     pink = "#F5C2E7",
--     mauve = "#DDB6F2",
--     red = "#F28FAD",
--     maroon = "#E8A2AF",
--     peach = "#F8BD96",
--     yellow = "#FAE3B0",
--     green = "#ABE9B3",
--     teal = "#B5E8E0",
--     sky = "#89DCEB",
--     sapphire = "#74C7EC",
--     blue = "#96CDFB",
--     lavender = "#C9CBFF",
--     text = "#CDD6F4",
--     subtext1 = "#BAC2DE",
--     subtext0 = "#A6ADC8",
--     overlay2 = "#9399B2",
--     overlay1 = "#7F849C",
--     overlay0 = "#6C7086",
--     surface2 = "#585B70",
--     surface1 = "#45475A",
--     surface0 = "#313244",
--     base = "#1E1E2E",
--     mantle = "#181825",
--     crust = "#11111B",
--   }
-- end

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

local c = require("catppuccin.api.colors").get_colors()

require("catppuccin").remap {
  -- TSKeyword = { fg = c.red, style = "NONE" }, -- different color
  -- TSField = { fg = c.lavender, style = "NONE" }, -- different color
  -- TSKeywordFunction = { fg = c.maroon, style = "NONE" }, -- different color
  -- TSKeywordReturn = { fg = c.pink, style = "NONE" }, -- different color
  -- TSParameter = { fg = c.teal, style = "NONE" }, -- different color, remove italics
  -- TSPunctBracket = { fg = c.subtext0 }, -- more bright
  -- Comment = { fg = c.overlay0, style = "italic" }, -- more bright
  TSParameter = { fg = c.maroon, style = "NONE" }, -- remove italics
  markdownTSLiteral = { fg = c.teal }, -- remove italics
  TSURI = { fg = c.rosewater, style = "underline" }, -- remove italics

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
