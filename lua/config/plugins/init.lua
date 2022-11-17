return require("packer").startup {
  function()
    local p = function(name)
      return string.format("require'config.plugins.%s'", name)
    end

    use { "lewis6991/impatient.nvim" }
    use { "wbthomason/packer.nvim" }

    use { "nvim-tree/nvim-web-devicons", config = p "webdevicons" }
    use { "nvim-lua/plenary.nvim", config = p "plenary" }
    use { "rcarriga/nvim-notify", config = p "notify" }
    use { "tami5/sqlite.lua", config = p "sqlite" }
    use { "MunifTanjim/nui.nvim" }
    use { "davidgranstrom/osc.nvim" }

    use { "catppuccin/nvim", as = "catppuccin", config = p "catppuccin", run = ":CatppuccinCompile" }

    use { "nvim-lualine/lualine.nvim", config = p "lualine", after = "catppuccin" }
    use { "akinsho/bufferline.nvim", config = p "bufferline", after = "lualine.nvim" }
    use { "goolord/alpha-nvim", config = p "alpha" }
    use { "folke/which-key.nvim", config = p "whichkey" }
    use { "folke/zen-mode.nvim", config = p "zenmode" }
    use { "norcalli/nvim-colorizer.lua", config = p "colorizer" }
    use { "numToStr/Comment.nvim", config = p "comment" }
    use { "akinsho/toggleterm.nvim", config = p "toggleterm", tag = "v2.*" }
    use { "stevearc/aerial.nvim", config = p "aerial" }

    local telescope_ext = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
      "cljoly/telescope-repo.nvim",
      "nvim-telescope/telescope-packer.nvim",
      "benfowler/telescope-luasnip.nvim",
    }
    if vim.fn.has "win32" == 1 then
      table.insert(telescope_ext, "davidgranstrom/telescope-scdoc.nvim")
    end
    use { "nvim-telescope/telescope.nvim", config = p "telescope", branch = "0.1.x", requires = telescope_ext }

    local ts_modules = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "p00f/nvim-ts-rainbow",
    }
    use { "nvim-treesitter/nvim-treesitter", config = p "treesitter", requires = ts_modules, run = ":TSUpdate" }

    use { "ray-x/lsp_signature.nvim" }
    use { "neovim/nvim-lspconfig", config = p "lsp" }
    use { "onsails/lspkind-nvim", config = p "lspkind" }

    use { "rafamadriz/friendly-snippets" }
    use { "L3MON4D3/LuaSnip", config = p "luasnip" }

    local cmp_sources = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
    }
    use { "hrsh7th/nvim-cmp", config = p "cmp", requires = cmp_sources, after = "lspkind-nvim" }

    use { "milisims/nvim-luaref" }
    use { "nanotee/nvim-lua-guide" }

    if vim.fn.has "win32" == 1 then
      use { "davidgranstrom/scnvim", config = p "scnvim" }
      use { "madskjeldgaard/sc-scratchpad.nvim", config = p "scscratchpad", after = "scnvim" }
    end
  end,

  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/config/compiled/packer/packer_compiled.lua",
    display = {
      prompt_border = "rounded",
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  },
}
