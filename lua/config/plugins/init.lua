return require"packer".startup({function()
  local branch

  local p = function(name)
    return string.format("require'config.plugins.%s'", name)
  end

  use { "lewis6991/impatient.nvim" }
  use { "wbthomason/packer.nvim" }

  use { "kyazdani42/nvim-web-devicons", config=p"webdevicons" }
  use { "nvim-lua/plenary.nvim", config=p"plenary" }
  use { "rcarriga/nvim-notify", config=p"notify" }
  use { "tami5/sqlite.lua", config=p"sqlite" }
  use { "MunifTanjim/nui.nvim" }

  use { "navarasu/onedark.nvim", config=p"onedark" }

  use { "nvim-lualine/lualine.nvim", config=p"lualine" }
  use { "goolord/alpha-nvim", config=p"alpha" }
  use { "romgrk/barbar.nvim", config=p"barbar" .. ".setup()" }
  use { "kyazdani42/nvim-tree.lua", config=p"tree" }
  use { "folke/which-key.nvim", config=p"whichkey" }
  use { "folke/zen-mode.nvim", config=p"zenmode" }
  use { "nvim-telescope/telescope.nvim", config=p"telescope" .. ".setup()" }
  use { "norcalli/nvim-colorizer.lua", config=p"colorizer" }

  --branch = vim.fn.has("nvim-0.7") == 1 and "master" or "0.6-compat"
  branch = "master"
  use { "nvim-treesitter/nvim-treesitter", branch=branch, config=p"treesitter", run=":TSUpdate" }
  use { "nvim-treesitter/playground" }
  use { "nvim-treesitter/nvim-treesitter-textobjects", branch=branch }

  branch = vim.fn.has("nvim-0.7") == 1 and "master" or "neovim-0.6"
  use { "ray-x/lsp_signature.nvim", branch=branch }
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
