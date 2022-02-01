local M = {}

local margin = 4 -- size of the left margin
local short = false -- display buffer indices only
local max_len = 90 -- max name length for standard layout
local alt = false -- use alternative layout
local alt_auto_width = true -- automatically adjust tabwidth for alt layout
local alt_width = 10 -- tabsize for alt layout if alt_auto_width = false
local alt_width_short = 2 -- tabsize for alt layout - short

local function ls()
  return vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf)
          and vim.api.nvim_buf_get_option(buf, "buflisted")
  end, vim.api.nvim_list_bufs())
end

local function trunc(s, length)
  return #s > length and string.sub(s, 1, length - 1) .. "…" or s
end

local function format_name(name)
  local auto_width = 0
  if alt and not short and alt_auto_width then
    local w = vim.api.nvim_get_option("columns") - margin - 3
    local n = #ls()
    auto_width = math.min(math.floor(w / n) - 7, math.floor(w / 2) - 7)
  end
  local max = short and alt_width_short or (alt_auto_width and auto_width or alt_width)
  if #name > max then
    name = string.sub(name, 1, max - 1) .. "…"
  else
    name = name .. string.rep(" ", max - #name)
  end
  return name
end

local function render(f)
  local c = require"onedark.colors"
  f.add(string.rep(" ", margin))

  f.make_bufs(function(info)
    f.add(alt and { "▎ ", fg=info.current and c.red or c.grey } or " ")

    local name
    if info.filename then
      local icon_color = info.current and f.icon_color(info.filename) or c.light_grey
      f.add { f.icon(info.filename) .. " ", fg=icon_color }
      name = short and tostring(info.index) or info.filename
    else
      f.add(" ")
      name = short and tostring(info.index) or "new " .. info.index
    end
    name = alt and format_name(name) or trunc(name, max_len)
    f.add(name)

    f.add(info.modified and " ● " or (alt and "   " or " "))
  end)

  f.add_spacer()
  local platform_icon = vim.fn.has("win32") == 1 and "  " or "  "
  f.add(platform_icon)
end

function M.toggle_colors()
  require"onedark".toggle()
  local c = require"onedark.colors"
  local Config = require"tabline_framework.config"
  Config.hl = {fg=c.light_grey, bg=c.bg1}
  Config.hl_sel = {fg=c.fg, bg=c.bg3}
  Config.hl_fill = {fg=c.fg, bg=c.bg0}
  vim.cmd "redrawtabline"
end

function M.toggle_short()
  short = not short
  vim.cmd "redrawtabline"
end

function M.toggle_alt()
  alt = not alt
  vim.cmd "redrawtabline"
end

function M.toggle_auto_width()
  alt_auto_width = not alt_auto_width
  vim.cmd "redrawtabline"
end

function M.set_margin(width)
  margin = width
  vim.cmd "redrawtabline"
end

function M.set_max_len(width)
  max_len = width
  vim.cmd "redrawtabline"
end

function M.set_width(width)
  alt_width = width
  vim.cmd "redrawtabline"
end

function M.setup()
  local c = require"onedark.colors"
  local map = require"config.utils.map".map

  require"tabline_framework".setup {
    render = render,
    hl = {fg=c.light_grey, bg=c.bg1},
    hl_sel = {fg=c.fg, bg=c.bg3},
    hl_fill = {fg=c.fg, bg=c.bg0},
  }

  map("n", "<A-.>", "<Cmd>bn<CR>")
  map("n", "<A-,>", "<Cmd>bp<CR>")
  map("n", "<A-c>", "<Cmd>bd<CR>")
  map("n", "<A-=>", "<Cmd>lua require'config.plugins.tablineframework'.toggle_short()<CR>")
  map("n", "<A-->", "<Cmd>lua require'config.plugins.tablineframework'.toggle_alt()<CR>")
  map("n", "<A-0>", "<Cmd>lua require'config.plugins.tablineframework'.toggle_auto_width()<CR>")
  map("n", "<Leader>cs", "<Cmd>lua require'config.plugins.tablineframework'.toggle_colors()<CR>")
end

return M
