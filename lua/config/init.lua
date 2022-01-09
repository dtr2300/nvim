pcall(require, "impatient")
require "config.options"
require "config.autocmd"
require "config.mappings".setup()
require "config.utils.globals"
require "config.plugins"
require "config.plugins.packer_compiled"
vim.cmd "colorscheme onedark"
require "config.gui".setup_no_ginit()
