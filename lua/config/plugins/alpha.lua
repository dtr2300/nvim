math.randomseed(os.time())

--- @param sc string
--- @param txt string
--- @param keybind string?
--- @param keybind_opts table?
--- @return table
local function button(sc, txt, keybind, keybind_opts)
  local b = require("alpha.themes.dashboard").button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButton"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  b.opts.width = 35
  return b
end

--- @param value table|string
--- @param hl string?
--- @return table
local function text(value, hl)
  return {
    type = "text",
    val = value,
    opts = {
      position = "center",
      hl = hl or "Normal",
    },
  }
end

--- @param value number
--- @return table
local function pad(value)
  return { type = "padding", val = value }
end

--- @param items table
--- @param spacing number?
local function group(items, spacing)
  return {
    type = "group",
    val = items,
    opts = {
      spacing = spacing or 0,
    },
  }
end

--- @return string
local function info()
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  local platform = vim.fn.has "win32" == 1 and "" or ""
  return string.format(" %d   v%d.%d.%d %s  %s", plugins, v.major, v.minor, v.patch, platform, datetime)
end

local header_color = "AlphaCol" .. math.random(5)

require("alpha").setup {
  layout = {
    pad(2),
    text(require("config.utils.headers").random(), header_color),
    pad(1),
    text(info(), header_color),
    pad(2),
    group {
      button("SPC t o", "  Recently opened files"),
      button("SPC t f", "  Find file"),
      button("SPC t l", "  Find word"),
      button("SPC t F", "  File browser"),
      button("SPC t 1", "  Find repo"),
      button("SPC t s", "  Open session"),
      button("SPC c n", "  New file"),
      button("SPC p u", "  Update plugins"),
      button("q", "  Quit", "<Cmd>qa<CR>"),
    },
    pad(1),
    text(require "alpha.fortune"(), "AlphaQuote"),
  },
  opts = {
    setup = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        desc = "Disable status and tabline for alpha",
        callback = function()
          vim.go.laststatus = 0
          vim.opt.showtabline = 0
          -- vim.opt.cmdheight = 0
        end,
      })
      vim.api.nvim_create_autocmd("BufUnload", {
        buffer = 0,
        desc = "Enable status and tabline after alpha",
        callback = function()
          vim.go.laststatus = 3
          vim.opt.showtabline = 2
          -- vim.opt.cmdheight = 1
        end,
      })
    end,
    margin = 5,
  },
}
