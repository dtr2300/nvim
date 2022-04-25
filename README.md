# nvim

This is my personal Neovim configuration (Windows, WSL/Ubuntu and Termux).

![screenshot](/assets/nvim.png)

## plugins

- [packer.nvim](https://github.com/wbthomason/packer.nvim) - plugin/package management for neovim
- [impatient.nvim](https://github.com/lewis6991/impatient.nvim) - speed up loading lua modules in neovim to improve startup time
<!-- break -->
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - adds filetype glyphs (icons) to various vim plugins
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - all the lua functions I don't want to write twice
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - a fancy, configurable, notification manager for neovim
- [sqlite.lua](https://github.com/tami5/sqlite.lua) - sqlite/luajit binding and a highly opinionated wrapper for storing, retrieving, caching, and persisting sqlite databases
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - ui component library for neovim
- [osc.nvim](https://github.com/davidgranstrom/osc.nvim) - open sound control (osc) library for neovim
<!-- break -->
- [onedark.nvim](https://github.com/navarasu/onedark.nvim) - a dark theme for neovim >= 0.5 based on atom one dark theme
- [catppuccin](https://github.com/catppuccin/nvim) - soothing pastel theme for neovim
<!-- break -->
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - a blazing fast and easy to configure neovim statusline
- [alpha-nvim](https://github.com/goolord/alpha-nvim) - a fast and highly customizable greeter for neovim
- [which-key.nvim](https://github.com/folke/which-key.nvim) - displays a popup with possible key bindings of the command you started typing
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - distraction-free coding for neovim
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - a high-performance color highlighter for neovim which has no external dependencies
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - smart and powerful comment plugin for neovim
<!-- break -->
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - a highly extendable fuzzy finder over lists
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) - a file browser extension for telescope.nvim
- [telescope-repo.nvim](https://github.com/cljoly/telescope-repo.nvim) - an extension for telescope.nvim that searches the filesystem for git or other repositories
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - fzf sorter for telescope written in c
- [telescope-packer.nvim](https://github.com/nvim-telescope/telescope-packer.nvim) - a telescope extension that provides extra functionality for packer.nvim
- [telescope-luasnip](https://github.com/benfowler/telescope-luasnip.nvim) - telescope.nvim extension that adds luasnip integration
<!-- break -->
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - provide a simple and easy way to use the interface for tree-sitter in neovim and provide some basic functionality such as highlighting based on it
- [playground](https://github.com/nvim-treesitter/playground) - view treesitter information directly in neovim
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - create your own textobjects using tree-sitter queries
<!-- break -->
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - a collection of common configurations for neovim's built-in language server client
- [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim) - show function signature when you type
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim) - vscode-like pictograms for neovim lsp completion items
- [nvim-ts-rainbow](https://github.com/p00f/nvim-ts-rainbow) - rainbow parentheses for neovim using tree-sitter
<!-- break -->
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - set of preconfigured snippets for different languages
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - snippet engine for neovim written in lua
<!-- break -->
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - a completion plugin for neovim coded in lua
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words
- [cmp-path](https://github.com/hrsh7th/cmp-path) - nvim-cmp source for path
- [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - nvim-cmp source for nvim lua
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim builtin lsp client
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - luasnip completion source for nvim-cmp
<!-- break -->
- [nvim-lua-guide](https://github.com/nanotee/nvim-lua-guide) - getting started using lua in neovim
- [nvim-luaref](https://github.com/milisims/nvim-luaref) - adds a reference for builtin lua functions, extracting both text and formatting from the lua 5.1 reference manual
<!-- break -->
- [scnvim](https://github.com/davidgranstrom/scnvim) - neovim frontend for supercollider
- [sc-scratchpad.nvim](https://github.com/madskjeldgaard/sc-scratchpad.nvim) - throwaway buffers for chaotic supercollider coders in neovim

## useful links

- index
    - [awesome neovim](https://github.com/rockerBOO/awesome-neovim)
    - [neovim craft](https://neovimcraft.com/) ([json](https://github.com/neurosnap/neovimcraft/blob/main/src/lib/resources.json))
    - [nvim.sh](https://github.com/neurosnap/nvim.sh)
- lua
    - [getting started using lua in neovim](https://github.com/nanotee/nvim-lua-guide)
    - [programming in lua (first edition)](https://www.lua.org/pil/contents.html)
    - [lua 5.1 reference manual](https://www.lua.org/manual/5.1/manual.html)
    - [learn lua in y minutes](https://learnxinyminutes.com/docs/lua/)
    - [first-class functions in an imperative world (pdf)](https://www.lua.org/doc/jucs17.pdf)
- viml
    - [learn vimscript in y minutes](https://learnxinyminutes.com/docs/vimscript/)
    - [vim script for python developers](https://gist.github.com/yegappan/16d964a37ead0979b05e655aa036cad0)
- neovim
    - [neovim](https://github.com/neovim/neovim)
    - [neovim.io](https://neovim.io/)
- breaking changes
    - [nvim](https://github.com/neovim/neovim/issues/14090)
    - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter/issues/2293)
    - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim/issues/1470)
    - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp/issues/231)
    - [luasnip](https://github.com/L3MON4D3/LuaSnip/issues/81)
    - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/issues/1075)
- community
    - [neovim reddit](https://www.reddit.com/r/neovim/)
    - [neovim discourse](https://neovim.discourse.group/)
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
    - [gh-s](https://github.com/gennaro-tedesco/gh-s)
- terminals
    - [windows terminal](https://docs.microsoft.com/en-us/windows/terminal/)
    - [wezterm](https://github.com/wez/wezterm)
- guis
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
    - [clangd](https://clangd.llvm.org/)
        - [bear](https://github.com/rizsotto/Bear)
        - [compiledb](https://pypi.org/project/compiledb/)
- misc
    - [neovim as a supercollider ide](https://madskjeldgaard.dk/posts/neovim-as-sc-ide/)

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
