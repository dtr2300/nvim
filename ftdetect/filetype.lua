vim.filetype.add {
  extension = {
    ghci = "haskell",
  },
}

-- already handled by scnvim
if vim.fn.has "win32" ~= 1 then
  vim.filetype.add {
    extension = {
      tidal = "haskell",
    },
  }
  vim.filetype.add {
    extension = {
      schelp = "scdoc",
    },
  }
end
