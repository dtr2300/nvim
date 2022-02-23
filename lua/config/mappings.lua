local M = {}

-- append blank lines
function M.append_blank_lines()
  vim.fn.append(vim.fn.line ".", vim.fn["repeat"]({ "" }, vim.api.nvim_get_vvar "count1"))
end

function M.setup()
  local map = require("config.utils.map").map

  -- new buffer
  map("n", "<Leader>cn", "<Cmd>ene<CR>")

  -- bubble lines
  map("n", "<C-Up>", "<Cmd>m .-2<CR>", { noremap = false, silent = true })
  map("n", "<C-Down>", "<Cmd>m .+1<CR>", { noremap = false, silent = true })
  map("v", "<C-Up>", [[@='"zxk"zP`[V`]'<CR>]])
  map("v", "<C-Down>", [[@='"zx"zp`[V`]'<CR>]])

  -- update
  map("n", "<Leader>pu", "<Cmd>PackerUpdate<CR>")
  map("n", "<Leader>pc", "<Cmd>PackerCompile<CR>")
  map("n", "<Leader>ps", "<Cmd>PackerSync<CR>")
  map("n", "<Leader>pU", "<Cmd>TSUpdate<CR>")
  map("n", "<Leader>pC", "<Cmd>LuaCacheClear<CR>")

  -- append N blank lines below cursor
  map("n", "<F3>", "<Cmd>lua require'config.mappings'.append_blank_lines()<CR>")

  -- spellcheck
  map("n", "<Leader>sn", "<Cmd>setlocal spelllang=nl<CR> <bar> <Cmd>setlocal spell<CR>")
  map("n", "<Leader>se", "<Cmd>setlocal spelllang=en<CR> <bar> <Cmd>setlocal spell<CR>")

  -- open terminal
  map("n", "<Leader>df", "<Cmd>lua require'config.utils.terminal'.float_terminal()<CR>")
  map("n", "<Leader>ds", "<Cmd>split | term<CR>")
  map("n", "<Leader>dv", "<Cmd>vsplit | term<CR>")
  map("n", "<Leader>dt", "<Cmd>term<CR>")

  -- change directory
  map("n", "<Leader>cd", "<Cmd>lcd %:p:h<CR><Cmd>lua require'config.utils.sessions'.info()<CR>")
  map(
    "n",
    "<Leader>cD",
    "<Cmd>lcd %:h | silent! lcd `git rev-parse --show-toplevel`<CR><Cmd>lua require'config.utils.sessions'.info()<CR>"
  )

  -- sessions
  map("n", "<Leader>si", "<Cmd>lua require'config.utils.sessions'.info()<CR>")
  map("n", "<Leader>ss", "<Cmd>lua require'config.utils.sessions'.open_session()<CR>")
  map("n", "<Leader>sS", "<Cmd>lua require'config.utils.sessions'.save_session()<CR>")
end

return M
