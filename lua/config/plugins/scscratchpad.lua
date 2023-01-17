return {
  "madskjeldgaard/sc-scratchpad.nvim",
  enabled = vim.fn.has "win32" == 1,
  cmd = "SCratch",
  opts = {
    keymaps = {
      toggle = "<F4>",
      send = "<M-e>",
    },
    border = "rounded",
    position = "50%",
    width = "50%",
    height = "50%",
    firstline = "// Scratchpad",
    open_insertmode = false,
    close_on_execution = false,
  },
}
