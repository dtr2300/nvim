local M = {}

local opts = {
  margin = 4, -- size of the left margin
  short = false, -- display buffer indices only
  max_len = 90, -- max name length for standard layout
  alt = false, -- use alternative layout
  alt_auto_width = true, -- automatically adjust tabwidth for alt layout
  alt_width = 10, -- tabsize for alt layout if alt_auto_width = false
  alt_width_short = 2, -- tabsize for alt layout - short
}

local function ls()
  return vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buflisted")
  end, vim.api.nvim_list_bufs())
end

local function trunc(s, length)
  return string.sub(s, 1, length - 1) .. "…"
end

local function trunc_name(name)
  return #name > opts.max_len and trunc(name, opts.max_len) or name
end

local function format_name(name)
  local auto_width = 0
  if opts.alt and not opts.short and opts.alt_auto_width then
    local w = vim.api.nvim_get_option("columns") - opts.margin - 3
    local n = #ls()
    auto_width = math.min(math.floor(w / n) - 7, math.floor(w / 2) - 7)
  end
  local max = opts.short and opts.alt_width_short or (opts.alt_auto_width and auto_width or opts.alt_width)
  if #name > max then
    name = trunc(name, max)
  else
    name = name .. string.rep(" ", max - #name)
  end
  return name
end

local function render(f)
  local c = require"onedark.colors"
  f.add(string.rep(" ", opts.margin))

  f.make_bufs(function(info)
    f.add(opts.alt and { "▎ ", fg=info.current and c.red or c.grey } or " ")

    local name
    if info.filename then
      local icon_color = info.current and f.icon_color(info.filename) or c.light_grey
      f.add { f.icon(info.filename) .. " ", fg=icon_color }
      name = opts.short and tostring(info.index) or info.filename
    else
      f.add(" ")
      name = opts.short and tostring(info.index) or "new " .. info.index
    end
    name = opts.alt and format_name(name) or trunc_name(name)
    f.add(name)

    f.add(info.modified and " ● " or (opts.alt and "   " or " "))
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
  opts.short = not opts.short
  vim.cmd "redrawtabline"
end

function M.toggle_alt()
  opts.alt = not opts.alt
  vim.cmd "redrawtabline"
end

function M.toggle_auto_width()
  opts.alt_auto_width = not opts.alt_auto_width
  vim.cmd "redrawtabline"
end

function M.set_margin(width)
  opts.margin = width
  vim.cmd "redrawtabline"
end

function M.set_max_len(width)
  opts.max_len = width
  vim.cmd "redrawtabline"
end

function M.set_width(width)
  opts.alt_width = width
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
