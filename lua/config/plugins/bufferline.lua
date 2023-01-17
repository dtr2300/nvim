return {
  "akinsho/bufferline.nvim",
  event = "ColorScheme",
  config = function()
    local c = require("catppuccin.palettes").get_palette "mocha"
    require("bufferline").setup {
      highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = {},
        custom = {
          mocha = {
            buffer_selected = { fg = c.text, bg = c.base, bold = false, italic = false },
            tab_close = { fg = c.surface1, bg = c.mantle, bold = false, italic = false },
            close_button = { fg = c.surface1, bg = c.mantle, bold = false, italic = false },
            close_button_visible = { fg = c.surface1, bg = c.mantle, bold = false, italic = false },
            close_button_selected = { fg = c.surface1, bg = c.base, bold = false, italic = false },
          },
        },
      },
    }
  end,
}
