math.randomseed(os.time())

--- @param args table
local function button(args)
  local b = require("alpha.themes.dashboard").button(args[1], args[2], args.keybind, args.keybind_opts)
  b.opts.hl = args.hl or "AlphaButton"
  b.opts.hl_shortcut = args.hl_shortcut or "AlphaButtonShortcut"
  b.opts.position = args.position or "center"
  b.opts.width = args.width or 35
  return b
end

--- @param value number?
local function pad(value)
  return { type = "padding", val = value or 2 }
end

local function info()
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  local platform = vim.fn.has "win32" == 1 and "" or ""
  return string.format(" %d   v%d.%d.%d %s  %s", plugins, v.major, v.minor, v.patch, platform, datetime)
end

-- header
local header = {
  type = "text",
  val = require("config.utils.headers").random(),
  opts = {
    position = "center",
    hl = "AlphaCol" .. math.random(5),
  },
}

-- subheader
local subheader = {
  type = "text",
  val = info(),
  opts = {
    position = "center",
    hl = header.opts.hl,
  },
}

-- buttons
local buttons = {
  type = "group",
  val = {
    button { "SPC t o", "  Recently opened files" },
    button { "SPC t f", "  Find file" },
    button { "SPC t l", "  Find word" },
    button { "SPC t F", "  File browser" },
    button { "SPC t 1", "  Find repo" },
    button { "SPC t s", "  Open session" },
    button { "SPC c n", "  New file" },
    button { "SPC p u", "  Update plugins" },
    button { "q", "  Quit", keybind = "<Cmd>qa<CR>" },
  },
  opts = {
    spacing = 0,
  },
}

-- quote
local quote = {
  type = "text",
  val = require "alpha.fortune"(),
  opts = {
    position = "center",
    hl = "AlphaQuote",
  },
}

require("alpha").setup {
  layout = {
    pad(),
    header,
    pad(1),
    subheader,
    pad(),
    buttons,
    pad(1),
    quote,
  },
  opts = {
    setup = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        desc = "disable status and tabline for alpha",
        callback = function()
          vim.go.laststatus = 0
          vim.opt.showtabline = 0
          -- vim.opt.cmdheight = 0
        end,
      })
      vim.api.nvim_create_autocmd("BufUnload", {
        buffer = 0,
        desc = "enable status and tabline after alpha",
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
