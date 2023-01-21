return function()
  local function find_sumneko_path(path)
    local dirs = require("plenary.scandir").scan_dir(path, { add_dirs = true, depth = 1 })
    for _, dir in ipairs(dirs) do
      if string.find(dir, "sumneko%.lua") or string.find(dir, "lua%-language%-server") then
        return dir
      end
    end
  end

  -- diagnostic symbols in the sign column (gutter)
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- disable underline
  vim.diagnostic.config { underline = false }

  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    --buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc") -- enable completion triggered by <c-x><c-o>

    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<Leader>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<Leader>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<Leader>wl", "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<Leader>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<Leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<Leader>e", "<Cmd>lua vim.diagnostic.open_float(0, scope='line'})<CR>", opts)
    buf_set_keymap("n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<Leader>q", "<Cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    buf_set_keymap("n", "<Leader>F", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- lsp_signature
    require("lsp_signature").on_attach()
  end

  -- setup language servers -----------------------

  -- pyright, vimls, bashls
  local servers = { "pyright", "vimls", "bashls", "clangd" }

  for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup { on_attach = on_attach }
  end

  -- sumneko_lua
  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  local sumneko_root_path

  if vim.fn.has "win32" == 1 then
    sumneko_root_path = find_sumneko_path "D:/Program Files"
  elseif vim.fn.has "wsl" == 1 then
    sumneko_root_path = find_sumneko_path "/home/dtr/.local/share"
  else
    sumneko_root_path = "/data/data/com.termux/files/usr/share/lua-language-server"
  end

  require("lspconfig").sumneko_lua.setup {
    on_attach = on_attach,
    cmd = { sumneko_root_path .. "/bin/lua-language-server", "-E", sumneko_root_path .. "/main.lua" },
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        completion = { enable = true },
        diagnostics = {
          globals = { "vim" },
          --disable = { "lowercase-global" },
        },
        semantic = { enable = false },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          preloadFileSize = 1000,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }

  -------------------------------------------------

  -- lspkind
  require("lspkind").init()
end
