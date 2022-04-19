-- options
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.hidden = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append "c"
vim.opt.fillchars = "eob: "
vim.opt.termguicolors = true
vim.opt.spelllang = "en"
vim.opt.ignorecase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showtabline = 2
vim.opt.showmode = false
vim.opt.list = false
vim.opt.listchars = { eol = "¬" }
--vim.opt.signcolumn = "number"

-- disable all providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- set interface language
if vim.fn.has "win32" == 1 then
  vim.cmd "lang messages en_GB"
end
