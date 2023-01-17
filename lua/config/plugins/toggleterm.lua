return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  version = "v2.*",
  init = function()
    vim.keymap.set("n", "<Leader>xf", '<Cmd>execute v:count . "ToggleTerm direction=float"<CR>', { silent = true })
    vim.keymap.set("n", "<Leader>xh", '<Cmd>execute v:count . "ToggleTerm direction=horizontal"<CR>', { silent = true })
    vim.keymap.set("n", "<Leader>xv", '<Cmd>execute v:count . "ToggleTerm direction=vertical"<CR>', { silent = true })
    vim.keymap.set("n", "<Leader>xt", '<Cmd>execute v:count . "ToggleTerm direction=tab"<CR>', { silent = true })
    vim.keymap.set("n", "<Leader>xb", "<Cmd>term<CR><Cmd>setlocal nonu nornu<CR>i", { silent = true })
  end,
  opts = {
    open_mapping = "<Leader>xh",
    insert_mappings = false,
    shade_terminals = false,
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.3
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.5
      end
    end,
    highlights = {
      FloatBorder = {
        link = "FloatBorder",
      },
    },
  },
}
