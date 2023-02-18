-- buffers
vim.keymap.set("n", "<Leader>cn", "<Cmd>ene<CR>", { silent = true })
vim.keymap.set("n", "<A-.>", "<Cmd>bn<CR>", { silent = true })
vim.keymap.set("n", "<A-,>", "<Cmd>bp<CR>", { silent = true })
vim.keymap.set("n", "<A-c>", "<Cmd>bp<Bar>sp<Bar>bn<Bar>bd<CR>", { silent = true })

-- bubble line(s)
vim.keymap.set("n", "<C-Up>", "<Cmd>m .-2<CR>", { noremap = false, silent = true })
vim.keymap.set("n", "<C-Down>", "<Cmd>m .+1<CR>", { noremap = false, silent = true })
vim.keymap.set("v", "<C-Up>", [[@='"zxk"zP`[V`]'<CR>]], { silent = true })
vim.keymap.set("v", "<C-Down>", [[@='"zx"zp`[V`]'<CR>]], { silent = true })

-- plugins
vim.keymap.set("n", "<Leader>p", "<Cmd>Lazy<CR>", { silent = true })

-- append N blank lines below cursor
vim.keymap.set("n", "<F3>", function()
  vim.fn.append(vim.fn.line ".", vim.fn["repeat"]({ "" }, vim.api.nvim_get_vvar "count1"))
end, { silent = true, desc = "Append N blank lines below cursor" })

-- spellcheck
vim.keymap.set("n", "<Leader>LN", "<Cmd>setlocal spelllang=nl<CR><Cmd>setlocal spell<CR>", { silent = true })
vim.keymap.set("n", "<Leader>LE", "<Cmd>setlocal spelllang=en<CR><Cmd>setlocal spell<CR>", { silent = true })

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

-- show session info
vim.keymap.set("n", "<Leader>ci", function()
  require("config.utils.sessions").info()
end, { silent = true, desc = "Show session info" })

-- set filetype
vim.keymap.set("n", "<Leader>Lc", "<Cmd>set ft=cpp<CR>", { silent = true })
vim.keymap.set("n", "<Leader>Lh", "<Cmd>set ft=haskell<CR>", { silent = true })
vim.keymap.set("n", "<Leader>Ll", "<Cmd>set ft=lua<CR>", { silent = true })
vim.keymap.set("n", "<Leader>Lm", "<Cmd>set ft=markdown<CR>", { silent = true })
vim.keymap.set("n", "<Leader>Lp", "<Cmd>set ft=python<CR>", { silent = true })
vim.keymap.set("n", "<Leader>Lr", "<Cmd>set ft=rust<CR>", { silent = true })
vim.keymap.set("n", "<Leader>Ls", "<Cmd>set ft=supercollider<CR>", { silent = true })

-- space paste
vim.keymap.set("x", "<Leader>p", [["_dP]], { noremap = true, silent = true })

-- hide number column
vim.keymap.set("n", "<Leader>zx", "<Cmd>setlocal nonu nornu scl=no<CR>", { silent = true })
