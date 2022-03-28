-- stylua: ignore start
return require("packer").startup {
  function()
    local p = function(name) return string.format("require'config.plugins.%s'", name) end

    use { "lewis6991/impatient.nvim" }
    use { "wbthomason/packer.nvim" }

    use { "kyazdani42/nvim-web-devicons", config = p"webdevicons" }
    use { "nvim-lua/plenary.nvim", config = p"plenary" }
    use { "rcarriga/nvim-notify", config = p"notify" }
    use { "tami5/sqlite.lua", config = p"sqlite" }
    use { "MunifTanjim/nui.nvim" }
    use { "davidgranstrom/osc.nvim", opt = true }

    use { "catppuccin/nvim", as = "catppuccin", config = p"catppuccin" }
    use { "navarasu/onedark.nvim", config = p"onedark", after = "catppuccin" }

    use { "nvim-lualine/lualine.nvim", config = p"lualine", after = "onedark.nvim" }
    use { "goolord/alpha-nvim", config = p"alpha", commit = "735d69022c0e9fe224e3e2e3cea30ca0e3e0f8ba" }
    use { "folke/which-key.nvim", config = p"whichkey" }
    use { "folke/zen-mode.nvim", config = p"zenmode" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "cljoly/telescope-repo.nvim" }
    use { "nvim-telescope/telescope.nvim", config = p"telescope" }
    use { "norcalli/nvim-colorizer.lua", config = p"colorizer" }

    use { "nvim-treesitter/nvim-treesitter", config = p"treesitter", run = ":TSUpdate" }
    use { "nvim-treesitter/playground" }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }

    local branch = vim.fn.has "nvim-0.7" == 1 and "master" or "neovim-0.6"
    use { "ray-x/lsp_signature.nvim", branch = branch }
    use { "neovim/nvim-lspconfig", config = p"lsp" }
    use { "onsails/lspkind-nvim", config = p"lspkind" }

    use { "L3MON4D3/LuaSnip", config = p"luasnip" }

    local cmp_sources = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-nvim-lsp", "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/nvim-cmp", config = p"cmp", requires = cmp_sources, after = "lspkind-nvim" }

    use { "milisims/nvim-luaref" }
    use { "nanotee/nvim-lua-guide" }

    if vim.fn.has "win32" == 1 then
      use { "davidgranstrom/scnvim", config = p"scnvim" }
      use { "madskjeldgaard/sc-scratchpad.nvim", config = p"scscratchpad", after = "scnvim" }
    end
  end,

  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/config/plugins/packer_compiled.lua",
    display = {
      open_fn = require("packer.util").float,
    },
  },
}
-- stylua: ignore end
