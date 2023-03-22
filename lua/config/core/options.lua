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
vim.opt.listchars = { tab = "╶─╴", lead = "·", trail = "▒", eol = "↲", extends = "►", precedes = "◄" }
vim.opt.ruler = false
vim.opt.cmdheight = 0
--vim.opt.signcolumn = "number"
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- disable providers
for _, provider in pairs { "python3", "node", "ruby", "perl" } do
  vim.g[string.format("loaded_%s_provider", provider)] = 0
end

-- mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- set interface language
if vim.fn.has "win32" == 1 then
  vim.cmd "lang messages en_GB"
end
