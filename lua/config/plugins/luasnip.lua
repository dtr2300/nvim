local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " <- Current Choice", "LuasnipChoice" } },
      },
    },
  },
}

-- load snippets
require "config.utils.snippets"
require("luasnip.loaders.from_vscode").lazy_load()

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true, desc = "Luasnip expand or jump next" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, desc = "Luasnip jump back" })

vim.keymap.set("i", "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { desc = "Luasnip next selection" })

vim.keymap.set("i", "<C-u>", function()
  require "luasnip.extras.select_choice"
end, { desc = "Luasnip extras select_choice" })

-- load scnvim snippets
if vim.fn.has "win32" == 1 then
  vim.keymap.set("n", "<Leader>LS", function()
    require("luasnip").add_snippets("supercollider", require("scnvim.utils").get_snippets(), { key = "scnvimsnippets" })
  end, { desc = "Load scnvim snippets" })
end
