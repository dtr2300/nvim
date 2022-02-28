local c = require "onedark.colors"

local custom_onedark = {
  normal = {
    a = { fg = c.bg0, bg = c.green, gui = "bold" },
    b = { fg = c.fg, bg = c.bg0 },
    c = { fg = c.fg, bg = c.bg0 },
  },
  command = { a = { fg = c.bg0, bg = c.bg_yellow, gui = "bold" } },
  insert = { a = { fg = c.bg0, bg = c.bg_blue, gui = "bold" } },
  visual = { a = { fg = c.bg0, bg = c.purple, gui = "bold" } },
  terminal = { a = { fg = c.bg0, bg = c.cyan, gui = "bold" } },
  replace = { a = { fg = c.bg0, bg = c.red, gui = "bold" } },
  inactive = {
    a = { fg = c.light_grey, bg = c.bg0, gui = "bold" },
    b = { fg = c.light_grey, bg = c.bg0 },
    c = { fg = c.light_grey, bg = c.bg0 },
  },
}

require("lualine").setup {
  options = {
    theme = custom_onedark,
  },
  tabline = {
    lualine_b = {
      function()
        return " "
      end,
    },
    lualine_c = {
      {
        "buffers",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        max_length = function()
          return vim.o.columns - 6
        end,
        buffers_color = {
          active = { fg = c.fg, bg = c.bg0 },
          inactive = { fg = c.grey, bg = c.bg0 },
        },
      },
    },
    lualine_y = {
      function()
        return vim.fn.has "win32" == 1 and "" or ""
      end,
    },
  },
  extensions = { "quickfix" },
}
