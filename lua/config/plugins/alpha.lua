local dashboard = require"alpha.themes.dashboard"
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "Function"
  b.opts.hl_shortcut = "Type"
  return b
end

local function pick_color()
  local colors = {"String", "Identifier", "Keyword"}
  return colors[math.random(#colors)]
end

local function footer()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  local datetime = os.date("%d-%m-%Y  %H:%M:%S")
  return total_plugins .. " plugins  " .. datetime
end

dashboard.section.header.val = {
  [[ _______             ____   ____.__         ]],
  [[ \      \   ____  ___\   \ /   /|__| _____  ]],
  [[ /   |   \_/ __ \/  _ \   Y   / |  |/     \ ]],
  [[/    |    \  ___(  <_> )     /  |  |  Y Y  \]],
  [[\____|__  /\___  >____/ \___/   |__|__|_|  /]],
  [[        \/     \/                        \/ ]],
}
dashboard.section.header.opts.hl = pick_color()

dashboard.section.buttons.val = {
  button("SPC f h", "  Recently opened files"),
  button("SPC f f", "  Find file"),
  button("SPC f a", "  Find word"),
  button("SPC s l", "  Open session"),
  button("SPC c n", "  New file"),
  button("SPC c c", "  Update plugins"),
  button("q", "  Quit", "<Cmd>qa<CR>")
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

require"alpha".setup(dashboard.opts)

-- hide tabline on startup screen
vim.cmd [[
augroup alpha_tabline
  au!
  au FileType alpha set showtabline=0 | au BufUnload <buffer> set showtabline=2
augroup END
]]
