-- stylua: ignore start
return require("packer").startup { function()
  local p = function(name) return string.format("require'config.plugins.%s'", name) end
  local s = function(name) return p(name) .. ".setup()" end

  use { "lewis6991/impatient.nvim" }
  use { "wbthomason/packer.nvim" }

  use { "kyazdani42/nvim-web-devicons", config = p"webdevicons" }
  use { "nvim-lua/plenary.nvim", config = p"plenary" }
  use { "rcarriga/nvim-notify", config = p"notify" }
  use { "tami5/sqlite.lua", config = p"sqlite" }
  use { "MunifTanjim/nui.nvim" }
  use { "davidgranstrom/osc.nvim", opt = true }

  use { "navarasu/onedark.nvim", config = p"onedark" }

  use { "nvim-lualine/lualine.nvim", config = p"lualine" }
  use { "goolord/alpha-nvim", config = p"alpha" }
  use { "rafcamlet/tabline-framework.nvim", config = s"tablineframework", after = "onedark.nvim" }
  use { "folke/which-key.nvim", config = p"whichkey" }
  use { "folke/zen-mode.nvim", config = p"zenmode" }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "cljoly/telescope-repo.nvim" }
  use { "nvim-telescope/telescope.nvim", config = s"telescope" }
  use { "norcalli/nvim-colorizer.lua", config = p"colorizer" }

  use { "nvim-treesitter/nvim-treesitter", config = p"treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/playground" }
  use { "nvim-treesitter/nvim-treesitter-textobjects" }

  local branch = vim.fn.has "nvim-0.7" == 1 and "master" or "neovim-0.6"
  use { "ray-x/lsp_signature.nvim", branch = branch }
  use { "neovim/nvim-lspconfig", config = p"lsp" }

  use { "L3MON4D3/LuaSnip", config = p"luasnip" }

  use { "hrsh7th/nvim-compe", config = p"compe" }

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
