vim.g.catppuccin_flavour = "mocha"

local c = require("catppuccin.palettes").get_palette()

require("catppuccin").setup {
  transparent_background = false,
  term_colors = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "config" .. "/lua/config/plugins",
    suffix = "_compiled",
  },
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "bold" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    aerial = true,
    barbar = false,
    beacon = false,
    cmp = true,
    coc_nvim = false,
    dashboard = false,
    fern = false,
    fidget = false,
    gitgutter = false,
    gitsigns = false,
    hop = false,
    leap = false,
    lightspeed = false,
    lsp_saga = false,
    lsp_trouble = false,
    markdown = true,
    mini = false,
    neogit = false,
    notify = true,
    nvimtree = false,
    overseer = false,
    pounce = false,
    symbols_outline = false,
    telekasten = false,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
    ts_rainbow = true,
    vim_sneak = false,
    vimwiki = false,
    which_key = true,
    dap = {
      enabled = false,
      enable_ui = false,
    },
    indent_blankline = {
      enabled = false,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = {},
        hints = {},
        warnings = {},
        information = {},
      },
    },
    navic = {
      enabled = false,
      custom_bg = "NONE",
    },
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
  },
  custom_highlights = {
    -- remove italics
    TSParameter = { fg = c.maroon, style = {} },
    markdownTSLiteral = { fg = c.teal, style = {} },
    markdown_inlineTSLiteral = { fg = c.teal, style = {} },
    TSURI = { fg = c.rosewater, style = { "underline" } },

    -- alpha
    AlphaButton = { fg = c.blue },
    AlphaButtonShortcut = { fg = c.sapphire },
    AlphaCol1 = { fg = c.red },
    AlphaCol2 = { fg = c.rosewater },
    AlphaCol3 = { fg = c.yellow },
    AlphaCol4 = { fg = c.green },
    AlphaCol5 = { fg = c.sky },
    AlphaCol6 = { fg = c.flamingo },
    AlphaCol7 = { fg = c.pink },
    AlphaCol8 = { fg = c.mauve },
    AlphaCol9 = { fg = c.maroon },
    AlphaCol10 = { fg = c.peach },
    AlphaCol11 = { fg = c.teal },
    AlphaQuote = { fg = c.lavender, style = { "italic" } },

    -- scnvim
    SCNvimEval = { fg = c.base, bg = c.lavender },

    -- tidal
    TidalEval = { fg = c.base, bg = c.lavender },

    -- luasnip
    LuaSnipChoiceNode = { fg = c.yellow, style = { "bold" } },
    LuaSnipInsertNode = { fg = c.white, style = { "bold" } },

    -- telescope
    TelescopePromptPrefix = { bg = c.crust },
    TelescopePromptNormal = { bg = c.crust },
    TelescopeResultsNormal = { bg = c.mantle },
    TelescopePreviewNormal = { bg = c.crust },
    TelescopePromptBorder = { bg = c.crust, fg = c.crust },
    TelescopeResultsBorder = { bg = c.mantle, fg = c.crust },
    TelescopePreviewBorder = { bg = c.crust, fg = c.crust },
    -- TelescopePromptTitle = { fg = c.crust },
    -- TelescopeResultsTitle = { fg = c.text },
    -- TelescopePreviewTitle = { fg = c.crust },

    -- bufferline
    BufferLineBufferSelected = { fg = c.text, bg = c.base, style = {} },
    BufferLineTabClose = { fg = c.surface1, bg = c.mantle },
    BufferLineCloseButtonSelected = { fg = c.surface1, bg = c.base },
    BufferLineBackground = { bg = c.mantle },
    BufferLineBackcrust = { fg = c.text, bg = c.mantle },
    BufferLineBufferVisible = { fg = c.surface1, bg = c.mantle },
    BufferLineTab = { fg = c.surface1, bg = c.mantle },
    BufferLineTabSelected = { fg = c.sky, bg = c.base },
    BufferLineIndicatorSelected = { fg = c.peach, bg = c.base },
    BufferLineSeparator = { fg = c.crust, bg = c.mantle },
    BufferLineSeparatorVisible = { fg = c.crust, bg = c.mantle },
    BufferLineSeparatorSelected = { fg = c.crust, bg = c.base },
    BufferLineCloseButton = { fg = c.surface1, bg = c.mantle },
    BufferLineCloseButtonVisible = { fg = c.surface1, bg = c.mantle },
    BufferLineFill = { bg = c.crust },
  },
}
