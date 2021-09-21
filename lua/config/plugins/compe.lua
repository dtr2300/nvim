require"compe".setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = "enable";
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = {"", "" ,"", " ", "", "", "", " "},
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = false;
    luasnip = false;
  };
}

local map = require"config.utils.map".map
local opts = {noremap=true, silent=true, expr=true}

map("i", "<C-Space>", "compe#complete()", opts)
map("i", "<CR>", "compe#confirm('<CR>')", opts)
map("i", "<C-e>", "compe#close('<C-e>')", opts)
map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", opts)
map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", opts)
