require("sc-scratchpad").setup {
  keymaps = {
    toggle = "<Leader>cp",
    send = "<C-e>",
  },
  border = "rounded",
  position = "50%",
  width = "50%",
  height = "50%",
  firstline = "// Scratchpad",
  open_insertmode = true,
  close_on_execution = false,
}
