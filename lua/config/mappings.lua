if vim.fn.has "nvim-0.7" == 1 then
  -- buffers
  vim.keymap.set("n", "<Leader>cn", "<Cmd>ene<CR>", { silent = true })
  vim.keymap.set("n", "<A-.>", "<Cmd>bn<CR>", { silent = true })
  vim.keymap.set("n", "<A-,>", "<Cmd>bp<CR>", { silent = true })
  vim.keymap.set("n", "<A-c>", "<Cmd>bd<CR>", { silent = true })

  -- bubble line(s)
  vim.keymap.set("n", "<C-Up>", "<Cmd>m .-2<CR>", { noremap = false, silent = true })
  vim.keymap.set("n", "<C-Down>", "<Cmd>m .+1<CR>", { noremap = false, silent = true })
  vim.keymap.set("v", "<C-Up>", [[@='"zxk"zP`[V`]'<CR>]], { silent = true })
  vim.keymap.set("v", "<C-Down>", [[@='"zx"zp`[V`]'<CR>]], { silent = true })

  -- update
  vim.keymap.set("n", "<Leader>pu", "<Cmd>PackerUpdate<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>pc", "<Cmd>PackerCompile<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>ps", "<Cmd>PackerSync<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>pU", "<Cmd>TSUpdate<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>pC", "<Cmd>LuaCacheClear<CR>", { silent = true })

  -- append N blank lines below cursor
  vim.keymap.set("n", "<F3>", require("config.utils").append_blank_lines, { silent = true })

  -- spellcheck
  vim.keymap.set("n", "<Leader>sn", "<Cmd>setlocal spelllang=nl<CR> <bar> <Cmd>setlocal spell<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>se", "<Cmd>setlocal spelllang=en<CR> <bar> <Cmd>setlocal spell<CR>", { silent = true })

  -- open terminal
  vim.keymap.set("n", "<Leader>df", require("config.utils.terminal").float_terminal, { silent = true })
  vim.keymap.set("n", "<Leader>ds", "<Cmd>split | term<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>dv", "<Cmd>vsplit | term<CR>", { silent = true })
  vim.keymap.set("n", "<Leader>dt", "<Cmd>term<CR>", { silent = true })

  -- change directory
  vim.keymap.set(
    "n",
    "<Leader>cd",
    "<Cmd>lcd %:p:h<CR><Cmd>lua require'config.utils.sessions'.info()<CR>",
    { silent = true }
  )
  vim.keymap.set(
    "n",
    "<Leader>cD",
    "<Cmd>lcd %:h | silent! lcd `git rev-parse --show-toplevel`<CR><Cmd>lua require'config.utils.sessions'.info()<CR>",
    { silent = true }
  )

  -- sessions
  vim.keymap.set("n", "<Leader>si", require("config.utils.sessions").info, { silent = true })
  vim.keymap.set("n", "<Leader>ss", require("config.utils.sessions").open_session, { silent = true })
  vim.keymap.set("n", "<Leader>sS", require("config.utils.sessions").save_session, { silent = true })

  -- messages
  vim.keymap.set("n", "<F12>", "<Cmd>messages<CR>", { silent = true })
else
  local map = require("config.utils.map").map
  -- buffers
  map("n", "<Leader>cn", "<Cmd>ene<CR>")
  map("n", "<A-.>", "<Cmd>bn<CR>")
  map("n", "<A-,>", "<Cmd>bp<CR>")
  map("n", "<A-c>", "<Cmd>bd<CR>")
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
  map("n", "<F3>", "<Cmd>lua require'config.utils'.append_blank_lines()<CR>")
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
  -- messages
  map("n", "<F12>", "<Cmd>messages<CR>")
end
