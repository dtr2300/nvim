local M = {}

-- append blank lines
function M.append_blank_lines()
  vim.fn.append(vim.fn.line("."), vim.fn["repeat"]({""}, vim.api.nvim_get_vvar("count1")))
end

function M.setup()
  local map = require"config.utils.map".map

  -- new buffer
  map("n", "<Leader>cn", "<Cmd>ene<CR>")

  -- show help
  map("n", "<F1>", "<Cmd>vert help<CR>")
  map("n", "<S-F1>", "<Cmd>tab help<CR>")

  -- execute current buffer
  map("n", "<F2>", "<Cmd>source %<CR>")

  -- bubble lines
  map("n", "<C-Up>", "<Cmd>m .-2<CR>", {noremap=false, silent=true})
  map("n", "<C-Down>", "<Cmd>m .+1<CR>", {noremap=false, silent=true})
  map("v", "<C-Up>", [[@='"zxk"zP`[V`]'<CR>]])
  map("v", "<C-Down>", [[@='"zx"zp`[V`]'<CR>]])

  -- update plugins
  map("n", "<Leader>cc", "<Cmd>PackerUpdate<CR>")
  map("n", "<Leader>cC", "<Cmd>PackerCompile<CR>")
  map("n", "<Leader>cS", "<Cmd>PackerSync<CR>")

  -- append N blank lines below cursor
  map("n", "<F3>", "<Cmd>lua require'config.mappings'.append_blank_lines()<CR>")

  -- spellcheck
  map("n", "<Leader>sn", "<Cmd>setlocal spelllang=nl<CR> <bar> <Cmd>setlocal spell<CR>")
  map("n", "<Leader>se", "<Cmd>setlocal spelllang=en<CR> <bar> <Cmd>setlocal spell<CR>")

  -- open float terminal
  map("n", "<Leader>dd", "<Cmd>lua require'config.utils.terminal'.float_terminal()<CR>")
  map("n", "<Leader>dg", "<Cmd>lua require'config.utils.terminal'.float_terminal('lazygit')<CR>")
  map("n", "<Leader>dm", "<Cmd>lua require'config.utils.terminal'.float_terminal('glow')<CR>")

  -- change directory
  map("n", "<Leader>cd", "<Cmd>lcd %:p:h<CR><Cmd>pwd<CR>")
  map("n", "<Leader>cD", "<Cmd>lcd %:h | lcd `git rev-parse --show-toplevel`<CR><Cmd>pwd<CR>")
end

return M
