-- options
local opt = vim.opt

opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 0
opt.completeopt = { "menu", "menuone", "noselect" }
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fillchars = "eob: "
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hidden = true
opt.ignorecase = true
opt.linebreak = true
opt.list = false
opt.listchars = { tab = "╶─╴", lead = "·", trail = "▒", eol = "↲", extends = "►", precedes = "◄" }
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 15
opt.relativenumber = true
opt.ruler = false
opt.sessionoptions = { "buffers", "curdir", "tabpages" }
opt.shiftround = true
opt.shiftwidth = 4
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.showmode = false
opt.showtabline = 2
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.spelllang = "en"
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.wildmode = "longest:full,full"
opt.wrap = true

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
