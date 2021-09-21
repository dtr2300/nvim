local M = {}

local function find_sumneko_path(vscode_extension_path)
  local dirs = require"plenary.scandir".scan_dir(vscode_extension_path, {add_dirs=true, depth=1})
  for _, dir in ipairs(dirs) do
    if string.find(dir, "sumneko%.lua") then
      return dir
    end
  end
end

function M.setup()
  -- diagnostic symbols in the sign column (gutter)
  local signs = {Error=" ", Warning=" ", Hint=" ", Information=" "}

  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, {text=icon, texthl=hl, numhl=""})
  end

  -- symbols for autocomplete
  vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)",
  }

  -- Disable underline
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {underline=false})

  -- use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local opts = {noremap=true, silent=true}

    -- enable completion triggered by <c-x><c-o>
    --buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- see `:help vim.lsp.*` for documentation on any of the below functions
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
    buf_set_keymap("n", "<Leader>e", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<Leader>q", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<Leader>F", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- lsp_signature
    require"lsp_signature".on_attach()
  end

  -- setup language servers -----------------------

  -- pyright, vimls, bashls
  local servers = {"pyright", "vimls"}
  if jit.os == "Linux" then
    table.insert(servers, "bashls")
  end

  for _, lsp in ipairs(servers) do
    require"lspconfig"[lsp].setup {on_attach=on_attach}
  end

  -- sumneko_lua
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  local sumneko_binary_name = (jit.os == "Windows") and "lua-language-server.exe" or "lua-language-server"
  local sumneko_root_path
  local sumneko_binary

  local is_wsl = not not vim.env.WSL_DISTRO_NAME
  if jit.os == "Windows" or is_wsl then
    local vscode_extension_path = ((jit.os == "Windows") and "C:" or "/mnt/c") .. "/Users/dtr2300/.vscode/extensions"
    sumneko_root_path = find_sumneko_path(vscode_extension_path) ..  "/server"
    sumneko_binary = sumneko_root_path .. "/bin/" .. jit.os .. "/" .. sumneko_binary_name
  else
    sumneko_root_path = "/data/data/com.termux/files/usr/lib/lua-language-server"
    sumneko_binary = sumneko_root_path .. "/" .. sumneko_binary_name
  end

  require"lspconfig".sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        completion = {enable=true},
        diagnostics = {
          globals = {"vim", "use", "packer_plugins", "reaper", "gfx", "love"},
          --disable = {"lowercase-global"},
        },
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
end

return M
