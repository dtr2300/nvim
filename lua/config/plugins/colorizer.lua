return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufNewFile", "BufReadPost", "BufWritePost" },
  opts = {
    css = { css = true },
    "javascript",
    "html",
    "lua",
  },
}
