local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " <- Current Choice", "NonTest" } },
      },
    },
  },
}

require("luasnip.loaders.from_vscode").lazy_load()

if vim.fn.has "nvim-0.7" == 1 then
  vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  vim.keymap.set("i", "<C-l>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end)

  vim.keymap.set("i", "<C-u>", require "luasnip.extras.select_choice")
else
  vim.cmd [[
    imap <silent><expr> <C-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''
    inoremap <silent> <C-j> <Cmd>lua require'luasnip'.jump(-1)<CR>
    imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
    snoremap <silent> <C-k> <Cmd>lua require'luasnip'.jump(1)<CR>
    snoremap <silent> <C-j> <Cmd>lua require'luasnip'.jump(-1)<CR>
    inoremap <silent> <C-u> <Cmd>lua require'luasnip.extras.select_choice'<CR>
  ]]
end
