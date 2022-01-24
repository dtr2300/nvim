local M = {}

local short = false

local render = function(f)
  local c = require"onedark.colors"
  f.add "   "

  f.make_bufs(function(info)
    --local col = info.current and c.red or c.grey
    --f.add { "▎ ", fg=col }
    f.add " "

    if info.filename then
      local icon_color = info.current and f.icon_color(info.filename) or c.grey
      f.add { f.icon(info.filename) .. " ", fg=icon_color }
      local name = short and tostring(info.index) or info.filename
      f.add(name)
    else
      local name = short and "" or "new "
      f.add(" " .. name .. info.index)
    end

    f.add(info.modified and " ● " or " ")
  end)

  f.add_spacer()
  local platform_icon = vim.fn.has("win32") == 1 and "  " or "  "
  f.add(platform_icon)
end

function M.toggle_display()
  short = not short
  vim.cmd "redrawtabline"
end

function M.toggle_colors()
  require"onedark".toggle()
  local c = require"onedark.colors"
  local Config = require"tabline_framework.config"
  Config.hl = {fg=c.grey, bg=c.bg1}
  Config.hl_sel = {fg=c.fg, bg=c.bg3}
  Config.hl_fill = {fg=c.fg, bg=c.bg0}
  vim.cmd "redrawtabline"
end

function M.setup()
  local c = require"onedark.colors"
  local map = require"config.utils.map".map

  require"tabline_framework".setup {
    render = render,
    hl = {fg=c.grey, bg=c.bg1},
    hl_sel = {fg=c.fg, bg=c.bg3},
    hl_fill = {fg=c.fg, bg=c.bg0},
  }

  map("n", "<A-.>", "<Cmd>bn<CR>")
  map("n", "<A-,>", "<Cmd>bp<CR>")
  map("n", "<A-c>", "<Cmd>bd<CR>")
  map("n", "<A-=>", "<Cmd>lua require'config.plugins.tablineframework'.toggle_display()<CR>")
  map("n", "<Leader>cs", "<Cmd>lua require'config.plugins.tablineframework'.toggle_colors()<CR>")
end

return M
