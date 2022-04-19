pcall(require, "impatient")
require "config.core.options"
require "config.core.mappings"
require "config.core.globals"
require "config.plugins"
require "config.plugins.packer_compiled"
require "config.core.autocmds"
require "config.core.misc"
require "config.core.colorscheme"
require("config.gui").setup_no_ginit()
