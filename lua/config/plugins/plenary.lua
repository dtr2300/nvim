return {
  "nvim-lua/plenary.nvim",
  config = function()
    require("plenary.filetype").add_file "supercollider"
    require("plenary.filetype").add_file "ghci"
    require("plenary.filetype").add_file "tidal"
  end,
}
