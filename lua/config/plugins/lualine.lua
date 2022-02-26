local c = require "onedark.colors"

local colors = {
  blue = c.bg_blue,
  green = c.green,
  purple = c.purple,
  cyan = c.cyan,
  red1 = c.red,
  red2 = c.dark_red,
  yellow = c.yellow,
  fg = c.fg,
  bg = c.bg0,
  gray1 = c.light_grey,
  gray2 = c.grey,
  gray3 = "#3e4452",
}

local custom_onedark = {
  normal = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg },
  },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = "bold" } },
  insert = { a = { fg = colors.bg, bg = colors.blue, gui = "bold" } },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = "bold" } },
  terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = "bold" } },
  replace = { a = { fg = colors.bg, bg = colors.red1, gui = "bold" } },
  inactive = {
    a = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
    b = { fg = colors.gray1, bg = colors.bg },
    c = { fg = colors.gray1, bg = colors.bg },
  },
}

require("lualine").setup {
  options = {
    theme = custom_onedark,
  },
  extensions = { "quickfix" },
}
