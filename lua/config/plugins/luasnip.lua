local ls = require "luasnip"
local types = require "luasnip.util.types"
local s = ls.snippet
--local sn = ls.snippet_node
--local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
--local f = ls.function_node
--local c = ls.choice_node
--local d = ls.dynamic_node
--local r = ls.restore_node
--local events = require "luasnip.util.events"
--local ai = require "luasnip.nodes.absolute_indexer"
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

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

ls.add_snippets("all", {
  -- test 1
  --s("ternary", { i(1, "cond"), t " ? ", i(2, "then"), t " : ", i(3, "else") }),
  -- test 2
  --s("trigger", { t "Wow! Text!" }),
  -- test 4
  --ls.parser.parse_snippet({ trig = "lsp" }, "$1 is ${2|hard,easy,challenging|}"),
  -- test 5
  s("date", { t(os.date "%d-%m-%y") }),
}, {
  key = "mysnippets",
})

ls.add_snippets("lua", {
  -- test 3
  --ls.parser.parse_snippet("expand", "-- this what expanded!"),
  -- test 5
  --ls.parser.parse_snippet("lf", "-- Defined in $TM_FILENAME\nlocal $1 = function($2)\n  $0\nend"),
  -- test 6
  --s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
  -- test 7
  s(
    "class",
    fmt(
      "local {} = {{}}\n{}.__index = {}\nsetmetatable({}, {{\n\t__call = function (cls, ...)\n\t\tlocal self = setmetatable({{}}, cls)\n\t\tself:_init(...)\n\t\treturn self\n\tend,\n}})\n\nfunction {}:_init({})\n\t{}\nend",
      { i(1, "ClassName"), rep(1), rep(1), rep(1), rep(1), i(2, "args"), i(3, "") }
    )
  ),
}, {
  key = "myluasnippets",
})

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
