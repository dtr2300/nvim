-- Options
vim.opt.cursorline = true
vim.opt.number = true
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
vim.opt.completeopt = "menuone,noselect"
vim.opt.fillchars = "eob: "
vim.opt.termguicolors = true
vim.opt.spelllang = "en"
vim.opt.ignorecase = true

-- Providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Set colorscheme
vim.g.onedark_style = "darker"
vim.cmd "colorscheme onedark"

-- Set interface language
if vim.fn.has("win32") == 1 then
  vim.cmd "lang messages en_GB"
end
