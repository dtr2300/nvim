vim.g.catppuccin_flavour = "mocha"

local c = require("catppuccin.api.colors").get_colors()

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
  custom_highlights = {
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

    -- aerial
    AerialClass = { fg = c.yellow },
    AerialClassIcon = { fg = c.yellow },
    AerialConstructor = { fg = c.sapphire },
    AerialConstructorIcon = { fg = c.sapphire },
    AerialEnum = { fg = c.yellow },
    AerialEnumIcon = { fg = c.yellow },
    AerialFunction = { fg = c.blue },
    AerialFunctionIcon = { fg = c.blue },
    AerialInterface = { fg = c.yellow },
    AerialInterfaceIcon = { fg = c.yellow },
    AerialModule = { fg = c.blue, style = "italic" },
    AerialModuleIcon = { fg = c.blue },
    AerialMethod = { fg = c.blue },
    AerialMethodIcon = { fg = c.blue },
    AerialStruct = { fg = c.yellow },
    AerialStructIcon = { fg = c.yellow },
  },
}
