local ls = require "luasnip"
local s = ls.snippet
--local sn = ls.snippet_node
--local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
--local f = ls.function_node
local c = ls.choice_node
--local d = ls.dynamic_node
--local r = ls.restore_node
--local events = require "luasnip.util.events"
--local ai = require "luasnip.nodes.absolute_indexer"
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("all", {
  -- test 1
  --s("ternary", { i(1, "cond"), t " ? ", i(2, "then"), t " : ", i(3, "else") }),
  -- test 2
  --s("trigger", { t "Wow! Text!" }),
  -- test 3
  --ls.parser.parse_snippet({ trig = "lsp" }, "$1 is ${2|hard,easy,challenging|}"),
  -- test 4
  s("date", { t(os.date "%d-%m-%y") }),
}, {
  key = "mysnippets",
})

ls.add_snippets("lua", {
  -- test 5
  --ls.parser.parse_snippet("expand", "-- this what expanded!"),
  -- test 6
  --ls.parser.parse_snippet("lf", "-- Defined in $TM_FILENAME\nlocal $1 = function($2)\n  $0\nend"),
  -- test 7
  --s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
  -- test 8
  s(
    "baseclass",
    fmt(
      table.concat {
        "local <> = {}\n",
        "<>.__index = <>\n",
        "setmetatable(<>, {\n",
        "\t__call = function (cls, ...)\n",
        "\t\tlocal self = setmetatable({}, cls)\n",
        "\t\tself:_init(...)\n",
        "\t\treturn self\n",
        "\tend,\n",
        "})\n\n",
        "function <>:_init(<>)\n",
        "\t<>\n",
        "end\n",
      },
      { i(1, "BaseClass"), rep(1), rep(1), rep(1), rep(1), i(2, "_"), i(3, "") },
      { delimiters = "<>" }
    )
  ),

  s(
    "derivedclass",
    fmt(
      table.concat {
        "local <> = {}\n",
        "for k, v in pairs(<>) do\n",
        "\t<>[k] = v\n",
        "end\n",
        "<>.__index = <>\n",
        "setmetatable(<>, {\n",
        "\t__index = <>,\n",
        "\t__call = function(cls, ...)\n",
        "\t\tlocal self = setmetatable({}, cls)\n",
        "\t\tself:_init(...)\n",
        "\t\treturn self\n",
        "\tend,\n",
        "})\n\n",
        "function <>:_init(<>)\n",
        "\t<>._init(self, <>)\n",
        "\t<>\n",
        "end\n",
      },
      {
        i(1, "DerivedClass"),
        i(2, "BaseClass"),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(2),
        rep(1),
        i(3, "_"),
        rep(2),
        i(4, "_"),
        i(5, ""),
      },
      { delimiters = "<>" }
    )
  ),
}, {
  key = "myluasnippets",
})

ls.add_snippets("supercollider", {
  -- test 9
  s(
    "Pbind",
    fmt("Pbind(\n\t\\scale, Scale.{},\n\t\\octave, {},\n\t\\degree, {},\n\t\\dur, {},\n\t\\legato, {},\n\t\\amp, {}\n);", {
      c(1, { t "minor", t "major" }),
      i(2, "4"),
      i(3, "Pseq(#[0, 2, 4, 6], inf)"),
      i(4, "Pseq(#[0.25, 0.25, 0.5], inf)"),
      i(5, "0.7"),
      i(6, "0.4"),
    })
  ),
}, {
  key = "mysupercollidersnippets",
})
