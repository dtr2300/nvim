local dashboard = require "alpha.themes.dashboard"
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButton"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  return b
end

local function footer()
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  local platform = vim.fn.has "win32" == 1 and "" or ""
  return string.format(" %d   v%d.%d.%d %s  %s", plugins, v.major, v.minor, v.patch, platform, datetime)
end

-- header
dashboard.section.header.val = require("config.utils.headers").random()
dashboard.section.header.opts.hl = "AlphaCol" .. math.random(5)

-- buttons
dashboard.section.buttons.val = {
  button("SPC t o", "  Recently opened files"),
  button("SPC t f", "  Find file"),
  button("SPC t l", "  Find word"),
  button("SPC t F", "  File browser"),
  button("SPC t 1", "  Find repo"),
  button("SPC t s", "  Open session"),
  button("SPC c n", "  New file"),
  button("SPC p u", "  Update plugins"),
  button("q", "  Quit", "<Cmd>qa<CR>"),
}

-- footer
dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = dashboard.section.header.opts.hl

-- quote
table.insert(dashboard.config.layout, { type = "padding", val = 1 })
table.insert(dashboard.config.layout, {
  type = "text",
  val = require "alpha.fortune"(),
  opts = {
    position = "center",
    hl = "AlphaQuote",
  },
})

require("alpha").setup(dashboard.config)

-- hide tabline and statusline on startup screen
vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  command = "set showtabline=0 laststatus=0 noruler",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  callback = function()
    vim.api.nvim_create_autocmd("BufUnload", {
      group = "alpha_tabline",
      buffer = 0,
      command = "set showtabline=2 ruler laststatus=3",
    })
  end,
})
