return require"packer".startup({function()
  local branch = vim.fn.has("nvim-0.6") == 1 and "master" or "0.5-compat"

  local p = function(name)
    return string.format("require'config.plugins.%s'", name)
  end

  use { "lewis6991/impatient.nvim" }
  use { "wbthomason/packer.nvim" }

  use { "kyazdani42/nvim-web-devicons", config=p"webdevicons" }
  use { "nvim-lua/plenary.nvim", config=p"plenary" }
  use { "rcarriga/nvim-notify", config=p"notify" }
  use { "tami5/sqlite.lua", config=p"sqlite" }

  use { "navarasu/onedark.nvim" }

  use { "nvim-lualine/lualine.nvim", config=p"lualine" }
  use { "goolord/alpha-nvim", config=p"alpha" }
  use { "romgrk/barbar.nvim", config=p"barbar" .. ".setup()" }
  use { "kyazdani42/nvim-tree.lua", config=p"tree" }
  use { "folke/which-key.nvim", config=p"whichkey" }
  use { "folke/zen-mode.nvim", config=p"zenmode" }
  use { "nvim-telescope/telescope.nvim", config=p"telescope" .. ".setup()" }
  use { "norcalli/nvim-colorizer.lua", config=p"colorizer" }

  use { "nvim-treesitter/nvim-treesitter", branch=branch, config=p"treesitter", run=":TSUpdate" }
  use { "nvim-treesitter/playground" }
  use { "nvim-treesitter/nvim-treesitter-textobjects", branch=branch }

  use { "ray-x/lsp_signature.nvim" }
  use { "neovim/nvim-lspconfig", config=p"lsp" }

  use { "hrsh7th/nvim-compe", config=p"compe" }

  use { "milisims/nvim-luaref" }
  use { "nanotee/nvim-lua-guide" }

  if vim.fn.has("win32") == 1 then
    use { "davidgranstrom/scnvim", config=p"scnvim" }
  end
end,

config = {
  compile_path = vim.fn.stdpath("config") .. "/lua/config/plugins/packer_compiled.lua",
  display = {
    open_fn = require"packer.util".float,
  }
}})
