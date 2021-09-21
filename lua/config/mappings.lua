local M = {}

-- append blank lines
function M.append_blank_lines()
  vim.fn.append(vim.fn.line("."), vim.fn["repeat"]({""}, vim.api.nvim_get_vvar("count1")))
end

function M.setup()
  local map = require"config.utils.map".map

  -- New file
  map("n", "<Leader>cn", "<Cmd>ene <BAR> startinsert<CR>")

  -- Show help in new tab
  map("n", "<F1>", "<Cmd>tab help<CR>")

  -- Execute current buffer
  map("n", "<F2>", "<Cmd>source %<CR>")

  -- Bubble lines
  map("n", "<C-Up>", "<Cmd>m .-2<CR>", {noremap=false, silent=true})
  map("n", "<C-Down>", "<Cmd>m .+1<CR>", {noremap=false, silent=true})
  map("v", "<C-Up>", [[@='"zxk"zP`[V`]'<CR>]])
  map("v", "<C-Down>", [[@='"zx"zp`[V`]'<CR>]])

  -- Update plugins
  map("n", "<Leader>cc", "<Cmd>PackerUpdate<CR>")

  -- Append N blank lines below cursor
  map("n", "<F3>", "<Cmd>lua require'config.mappings'.append_blank_lines()<CR>")

  -- Un-highlight
  map("n", "<Leader>ch", "<Cmd>noh<CR>")

  -- Spellcheck
  map("n", "<Leader>sn", "<Cmd>setlocal spelllang=nl<CR> <bar> <Cmd>setlocal spell<CR>")
  map("n", "<Leader>se", "<Cmd>setlocal spelllang=en<CR> <bar> <Cmd>setlocal spell<CR>")

  -- Open float terminal
  map("n", "<Leader>dd", "<Cmd>lua require'config.utils.terminal'.float_terminal()<CR>")
  map("n", "<Leader>dg", "<Cmd>lua require'config.utils.terminal'.float_terminal('lazygit')<CR>")
  map("n", "<Leader>dm", "<Cmd>lua require'config.utils.terminal'.float_terminal('glow')<CR>")
end

return M
