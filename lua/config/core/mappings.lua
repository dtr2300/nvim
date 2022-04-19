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
vim.keymap.set("n", "<F3>", function()
  vim.fn.append(vim.fn.line ".", vim.fn["repeat"]({ "" }, vim.api.nvim_get_vvar "count1"))
end, { silent = true, desc = "Append N blank lines below cursor" })

-- spellcheck
vim.keymap.set("n", "<Leader>sn", "<Cmd>setlocal spelllang=nl<CR> <bar> <Cmd>setlocal spell<CR>", { silent = true })
vim.keymap.set("n", "<Leader>se", "<Cmd>setlocal spelllang=en<CR> <bar> <Cmd>setlocal spell<CR>", { silent = true })

-- open terminal
vim.keymap.set(
  "n",
  "<Leader>df",
  require("config.utils.terminal").float_terminal,
  { silent = true, desc = "Open floating terminal" }
)
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
vim.keymap.set("n", "<Leader>si", require("config.utils.sessions").info, { silent = true, desc = "Show session info" })
vim.keymap.set(
  "n",
  "<Leader>ss",
  require("config.utils.sessions").open_session,
  { silent = true, desc = "Open session" }
)
vim.keymap.set(
  "n",
  "<Leader>sS",
  require("config.utils.sessions").save_session,
  { silent = true, desc = "Save session" }
)

-- messages
vim.keymap.set("n", "<F12>", "<Cmd>messages<CR>", { silent = true })

-- set filetype
vim.keymap.set("n", "<Leader>yc", "<Cmd>set ft=cpp<CR>", { silent = true })
vim.keymap.set("n", "<Leader>yl", "<Cmd>set ft=lua<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ym", "<Cmd>set ft=markdown<CR>", { silent = true })
vim.keymap.set("n", "<Leader>yp", "<Cmd>set ft=python<CR>", { silent = true })
vim.keymap.set("n", "<Leader>yr", "<Cmd>set ft=rust<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ys", "<Cmd>set ft=supercollider<CR>", { silent = true })
