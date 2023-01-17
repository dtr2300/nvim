return {
  "tami5/sqlite.lua",
  config = function()
    if vim.fn.has "win32" == 1 then
      vim.g.sqlite_clib_path = vim.env.USERPROFILE .. "/AppData/Local/nvim-data/sqlite3.dll"
    end
  end,
}
