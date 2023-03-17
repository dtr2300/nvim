return {
  "dtr2300/tidal.nvim",
  enabled = vim.fn.has "win32" == 1 or vim.fn.has "wsl" == 1,
  event = "BufReadPre *.tidal",
  opts = {
    boot = vim.fn.has "win32" == 1 and {
      boot_ghci = "F:/devel/tidal/boot/boot.ghci",
      start_superdirt_scd = "F:/devel/tidal/boot/start_superdirt.scd",
      start_midi_scd = "F:/devel/tidal/boot/start_midi.scd",
    } or {
      boot_ghci = "/mnt/f/devel/tidal/boot/boot_wsl.ghci",
    },
    plenary = false,
    highlight = "TidalEval",
  },
}
