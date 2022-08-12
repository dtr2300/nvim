---@param sc string
---@param txt string
---@param keybind string?
---@param keybind_opts table?
---@param opts table?
---@return table
local function button(sc, txt, keybind, keybind_opts, opts)
  local b = require("alpha.themes.dashboard").button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButton"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  b.opts.width = 35
  b.opts.position = "center"
  if opts ~= nil then
    b.opts = vim.tbl_extend("force", b.opts, opts)
  end
  return b
end

---@return string
local function info()
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  local platform = vim.fn.has "win32" == 1 and "" or ""
  return string.format(" %d   v%d.%d.%d %s  %s", plugins, v.major, v.minor, v.patch, platform, datetime)
end

---@param name string
---@return boolean
local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

---@return table
local function mru()
  local result = {}
  for _, filename in ipairs(vim.v.oldfiles) do
    if file_exists(filename) then
      local icon, hl = require("nvim-web-devicons").get_icon(filename, vim.fn.fnamemodify(filename, ":e"))
      local filename_short = string.sub(vim.fn.fnamemodify(filename, ":t"), 1, 30)
      table.insert(
        result,
        button(
          string.format("%d", #result + 1),
          string.format("%s  %s", icon, filename_short),
          string.format("<Cmd>e %s<CR>", filename),
          nil,
          { hl = { { hl, 0, 3 }, { "Normal", 5, #filename_short + 5 } } }
        )
      )
      if #result >= 9 then
        break
      end
    end
  end
  return result
end

math.randomseed(os.time())
local header_color = "AlphaCol" .. math.random(5)

require("alpha").setup {
  layout = {
    { type = "padding", val = 2 },
    {
      type = "text",
      val = require("config.utils.headers").random(),
      opts = { hl = header_color, position = "center" },
    },
    { type = "padding", val = 1 },
    {
      type = "text",
      val = info(),
      opts = { hl = header_color, position = "center" },
    },
    { type = "padding", val = 4 },
    {
      type = "group",
      val = {
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
      opts = { spacing = 0 },
    },
    { type = "padding", val = 2 },
    {
      type = "group",
      val = mru,
      opts = { spacing = 0 },
    },
    { type = "padding", val = 3 },
    {
      type = "text",
      val = require "alpha.fortune"(),
      opts = { hl = "AlphaQuote", position = "center" },
    },
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
