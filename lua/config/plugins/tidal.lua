return {
  "dtr2300/tidal.nvim",
  enabled = vim.fn.has "win32" == 1,
  event = "BufReadPre *.tidal",
  opts = {
    boot = {
      boot_ghci = "F:/devel/tidal/boot/boot.ghci",
      start_superdirt_scd = "F:/devel/tidal/boot/start_superdirt.scd",
      start_midi_scd = "F:/devel/tidal/boot/start_midi.scd",
    },
    plenary = false,
    highlight = "TidalEval",
  },
}
