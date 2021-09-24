return require"packer".startup({function()
  local branch = vim.fn.has("nvim-0.6") == 1 and "master" or "0.5-compat"

  use { "lewis6991/impatient.nvim" }
  use { "wbthomason/packer.nvim" }

  use { "kyazdani42/nvim-web-devicons", config="require'config.plugins.webdevicons'" }
  use { "nvim-lua/plenary.nvim", config="require'config.plugins.plenary'" }
  use { "rcarriga/nvim-notify" }

  use { "navarasu/onedark.nvim" }

  use { "shadmansaleh/lualine.nvim", config="require'config.plugins.lualine'" }
  use { "goolord/alpha-nvim", config="require'config.plugins.alpha'" }
  use { "romgrk/barbar.nvim", config="require'config.plugins.barbar'.setup()" }
  use { "kyazdani42/nvim-tree.lua", config="require'config.plugins.tree'.setup()" }
  use { "folke/which-key.nvim", config="require'config.plugins.whichkey'" }
  use { "folke/zen-mode.nvim", config="require'config.plugins.zenmode'" }
  use { "nvim-telescope/telescope.nvim", config="require'config.plugins.telescope'.setup()" }
  use { "norcalli/nvim-colorizer.lua", config="require'config.plugins.colorizer'" }

  use { "nvim-treesitter/nvim-treesitter", branch=branch, config="require'config.plugins.treesitter'", run=":TSUpdate" }
  use { "nvim-treesitter/playground" }
  use { "nvim-treesitter/nvim-treesitter-textobjects", branch=branch }

  use { "ray-x/lsp_signature.nvim" }
  use { "neovim/nvim-lspconfig", config="require'config.plugins.lsp'.setup()" }

  use { "hrsh7th/nvim-compe", config="require'config.plugins.compe'" }

  use { "milisims/nvim-luaref" }
  use { "nanotee/nvim-lua-guide" }

  if jit.os == "Windows" then
    use { "davidgranstrom/scnvim", config="require'config.plugins.scnvim'" }
  end
end,

config = {
  compile_path = vim.fn.stdpath("config").."/lua/config/plugins/packer_compiled.lua",
  display = {
    open_fn = require"packer.util".float,
  }
}})
