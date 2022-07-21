vim.g.catppuccin_flavour = "mocha"

local c = require("catppuccin.palettes").get_palette()

require("catppuccin").setup {
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = false,
  term_colors = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "config" .. "/lua/config/plugins",
    suffix = "_compiled",
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
    treesitter = true,
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
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = false,
    leap = false,
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
    dap = {
      enabled = false,
      enable_ui = false,
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
    mini = false,
    aerial = true,
    vimwiki = false,
    beacon = false,
  },
  custom_highlights = {
    -- remove italics
    TSParameter = { fg = c.maroon, style = {} },
    markdownTSLiteral = { fg = c.teal, style = {} },
    markdown_inlineTSLiteral = { fg = c.teal, style = {} },
    TSURI = { fg = c.rosewater, style = { "underline" } },

    -- alpha
    AlphaButton = { fg = c.blue },
    AlphaButtonShortcut = { fg = c.peach },
    AlphaCol1 = { fg = c.red },
    AlphaCol2 = { fg = c.rosewater },
    AlphaCol3 = { fg = c.yellow },
    AlphaCol4 = { fg = c.green },
    AlphaCol5 = { fg = c.sky },
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
  },
}
