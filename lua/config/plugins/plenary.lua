return {
  "nvim-lua/plenary.nvim",
  config = function()
    require("plenary.filetype").add_file "supercollider"
    require("plenary.filetype").add_file "ghci"
  end,
}
