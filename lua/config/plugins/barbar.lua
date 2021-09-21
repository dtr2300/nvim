local M = {}

function M.update_colors()
  local c = require("onedark.colors")
  local colors = {
    {"BufferVisible", c.fg, c.bg0},
    {"BufferVisibleSign", c.fg, c.bg0},
    --{"BufferVisibleIcon", c.fg, c.bg0},
    {"BufferVisibleIndex", c.fg, c.bg0},
    {"BufferVisibleTarget", c.red, c.bg0},
    {"BufferVisibleMod", c.yellow, c.bg0},
  }
  for i = 1, #colors do
    --vim.cmd(string.format("hi %s guifg=%s guibg=%s\n", colors[i][1], colors[i][2], colors[i][3]))
    vim.highlight.create(colors[i][1], {guifg=colors[i][2], guibg=colors[i][3]}, false)
  end
end

function M.setup()
  local map = require"config.utils.map".map

  vim.g.bufferline = {
    icon_pinned = "車",
    icon_custom_colors = true,
  }

  vim.cmd [[
  augroup barbar_colors
    au!
    au VimEnter,ColorScheme * lua require"config.plugins.barbar".update_colors()
  augroup END
  ]]

  -- move to previous/next
  map("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
  map("n", "<A-.>", "<Cmd>BufferNext<CR>")
  -- re-order to previous/next
  map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
  map("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
  -- goto buffer in position...
  map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
  map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
  map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
  map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
  map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
  map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
  map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
  map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
  map("n", "<A-9>", "<Cmd>BufferLast<CR>")
  -- pin/unpin buffer
  map("n", "<A-p>", "<Cmd>BufferPin<CR>")
  -- close buffer
  map("n", "<A-c>", "<Cmd>BufferClose<CR>")
  -- magic buffer-picking mode
  map("n", "<C-s>", "<Cmd>BufferPick<CR>")
  -- sort automatically by...
  map("n", "<Leader>bd", "<Cmd>BufferOrderByDirectory<CR>")
  map("n", "<Leader>bl", "<Cmd>BufferOrderByLanguage<CR>")
  -- other
  map("n", "<Leader>be", "<Cmd>BarbarEnable<CR>")
  map("n", "<Leader>bx", "<Cmd>BarbarDisable<CR>")
end

return M
