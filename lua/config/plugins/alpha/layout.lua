math.randomseed(os.time())
local header_color = "AlphaCol" .. math.random(11)

local utils = require "config.plugins.alpha.utils"

return {
  { type = "padding", val = 2 },
  {
    type = "text",
    -- val = require("config.plugins.alpha.headers").random(),
    val = require("config.plugins.alpha.headers").block2,
    opts = { hl = header_color, position = "center" },
  },
  { type = "padding", val = 1 },
  {
    type = "text",
    val = utils.info(),
    opts = { hl = header_color, position = "center" },
  },
  { type = "padding", val = 4 },
  {
    type = "group",
    val = {
      utils.button("SPC t o", "  Recently opened files"),
      utils.button("SPC t f", "  Find file"),
      utils.button("SPC t l", "  Find word"),
      utils.button("SPC t F", "  File browser"),
      utils.button("SPC t 1", "  Find repo"),
      utils.button("SPC t s", "  Open session"),
      utils.button("SPC c n", "  New file"),
      utils.button("SPC p u", "  Plugins"),
      utils.button("q", "  Quit", "<Cmd>qa<CR>"),
    },
    opts = { spacing = 0 },
  },
  { type = "padding", val = 2 },
  {
    type = "group",
    val = utils.mru,
    opts = { spacing = 0 },
  },
  { type = "padding", val = 3 },
  {
    type = "text",
    val = require "alpha.fortune"(),
    opts = { hl = "AlphaQuote", position = "center" },
  },
}
