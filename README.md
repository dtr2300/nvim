# nvim

This is my personal Neovim configuration (Windows, WSL/Ubuntu and Termux).

![screenshot](/assets/nvim.png)

## plugins

- [packer.nvim](https://github.com/wbthomason/packer.nvim) plugin/package management for neovim
- [impatient.nvim](https://github.com/lewis6991/impatient.nvim) speed up loading lua modules in neovim to improve startup time
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) adds filetype glyphs (icons) to various vim plugins
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) all the lua functions I don't want to write twice
- [nvim-notify](https://github.com/rcarriga/nvim-notify) a fancy, configurable, notification manager for neovim
- [sqlite.lua](https://github.com/tami5/sqlite.lua) sqlite/luajit binding and a highly opinionated wrapper for storing, retrieving, caching, and persisting sqlite databases
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim) ui component library for neovim
- [onedark.nvim](https://github.com/navarasu/onedark.nvim) a dark theme for neovim >= 0.5 based on atom one dark theme
- [tabline-framework.nvim](https://github.com/rafcamlet/tabline-framework.nvim) user-friendly framework for building your dream tabline in a few lines of code
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) a blazing fast and easy to configure neovim statusline
- [alpha-nvim](https://github.com/goolord/alpha-nvim) a fast and highly customizable greeter for neovim
- [which-key.nvim](https://github.com/folke/which-key.nvim) displays a popup with possible key bindings of the command you started typing
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) distraction-free coding for neovim
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) a highly extendable fuzzy finder over lists
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) a file browser extension for telescope.nvim
- [telescope-repo.nvim](https://github.com/cljoly/telescope-repo.nvim) an extension for telescope.nvim that searches the filesystem for git or other repositories
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) fzf sorter for telescope written in c
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) a high-performance color highlighter for neovim which has no external dependencies
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) provide a simple and easy way to use the interface for tree-sitter in neovim and provide some basic functionality such as highlighting based on it
- [playground](https://github.com/nvim-treesitter/playground) view treesitter information directly in neovim
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) create your own textobjects using tree-sitter queries
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) a collection of common configurations for neovim's built-in language server client
- [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) show function signature when you type
- [nvim-compe](https://github.com/hrsh7th/nvim-compe) auto completion plugin for neovim
- [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide) getting started using lua in neovim
- [nvim-luaref](https://github.com/milisims/nvim-luaref) adds a reference for builtin lua functions, extracting both text and formatting from the lua 5.1 reference manual
- [scnvim](https://github.com/davidgranstrom/scnvim) neovim frontend for supercollider

### removed

- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) a file explorer for neovim
- [barbar.nvim](https://github.com/romgrk/barbar.nvim) tabs, as understood by any other editor

## useful links

- index
    - [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim)
    - [Neovim Craft](https://neovimcraft.com/) ([json](https://github.com/neurosnap/neovimcraft/blob/main/src/lib/resources.json))
    - [nvim.sh](https://github.com/neurosnap/nvim.sh)
- lua
    - [Getting started using Lua in Neovim](https://github.com/nanotee/nvim-lua-guide)
    - [Programming in Lua (first edition)](https://www.lua.org/pil/contents.html)
    - [Lua 5.1 Reference Manual](https://www.lua.org/manual/5.1/manual.html)
    - [Learn Lua in Y Minutes](https://learnxinyminutes.com/docs/lua/)
- viml
    - [Learn Vimscript in Y Minutes](https://learnxinyminutes.com/docs/vimscript/)
    - [Vim Script for Python Developers](https://gist.github.com/yegappan/16d964a37ead0979b05e655aa036cad0)
- neovim
    - [neovim](https://github.com/neovim/neovim)
    - [neovim.io](https://neovim.io/)
    - [Following HEAD: breaking changes on master](https://github.com/neovim/neovim/issues/14090)
- community
    - [Neovim Reddit](https://www.reddit.com/r/neovim/)
    - [Neovim Discourse](https://neovim.discourse.group/)
- tools
    - [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
    - [stylua](https://github.com/JohnnyMorganz/StyLua)
    - [ripgrep](https://github.com/BurntSushi/ripgrep)
    - [fd](https://github.com/sharkdp/fd)
    - [fzf](https://github.com/junegunn/fzf)
    - [lazygit](https://github.com/jesseduffield/lazygit)
    - [glow](https://github.com/charmbracelet/glow)
    - [bat](https://github.com/sharkdp/bat)
    - [delta](https://github.com/dandavison/delta)
    - [exa](https://github.com/ogham/exa)
    - [gh](https://github.com/cli/cli)
- gui
    - [neovim-qt](https://github.com/equalsraf/neovim-qt)
    - [nvui](https://github.com/rohit-px2/nvui)
    - [neovide](https://github.com/neovide/neovide)
    - [nvy](https://github.com/RMichelsen/Nvy)
    - [goneovim](https://github.com/akiyosi/goneovim)
    - [fvim](https://github.com/yatli/fvim)
- language servers
    - [pyright](https://github.com/microsoft/pyright)
    - [vim-language-server](https://github.com/iamcco/vim-language-server)
    - [bash-language-server](https://github.com/bash-lsp/bash-language-server)
    - [sumneko-lua](https://github.com/sumneko/lua-language-server)
- misc
    - [Neovim as a SuperCollider IDE](https://madskjeldgaard.dk/posts/neovim-as-sc-ide/)

## other configs

[search](https://github.com/search?l=&o=desc&q=vim+language%3ALua&s=indexed&type=Code)

- https://github.com/aserowy/NeoCode
- https://github.com/ashincoder/StarVim
- https://github.com/ayamir/nvimdots
- https://github.com/brainfucksec/neovim-lua
- https://github.com/budswa/nvim
- https://github.com/ChristianChiarulli/LunarVim
- https://github.com/crivotz/nv-ide
- https://github.com/danielnehrig/nvim
- https://github.com/davidgranstrom/vim-conf
- https://github.com/dhruvmanila/dotfiles
- https://github.com/e-cal/evim
- https://github.com/ecosse3/nvim
- https://github.com/elianiva/dotfiles
- https://github.com/folke/dot
- https://github.com/fsouza/dotfiles
- https://github.com/glepnir/nvim
- https://github.com/goolord/nvim
- https://github.com/GustavoPrietoP/evil-nvim
- https://github.com/hackorum/VapourNvim
- https://github.com/ibhagwan/nvim-lua
- https://github.com/icyphox/dotfiles
- https://github.com/jdhao/nvim-config
- https://github.com/kabouzeid/dotfiles
- https://github.com/kristijanhusak/neovim-config
- https://github.com/kunzaatko/nvim-dots
- https://github.com/martinsione/dotfiles
- https://github.com/mattleong/CosmicNvim
- https://github.com/mjlbach/defaults.nvim
- https://github.com/mte90/dotfiles
- https://github.com/noib3/dotfiles/
- https://github.com/NTBBloodbath/doom-nvim
- https://github.com/NvChad/NvChad
- https://github.com/nvim-lua/kickstart.nvim
- https://github.com/olgam4/nvim
- https://github.com/olimorris/dotfiles
- https://github.com/samrath2007/kyoto.nvim
- https://github.com/shaeinst/roshnivim
- https://github.com/smithbm2316/dotfiles
- https://github.com/Takachii15/dotfiles/tree/master/.config/nvim
- https://github.com/Theory-of-Everything/nii-nvim
- https://github.com/tjdevries/config_manager
- https://github.com/vi-tality/neovitality
- https://github.com/wbthomason/dotfiles
- https://gitlab.com/ysfgrg/nvoid 
