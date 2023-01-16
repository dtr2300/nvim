local M = {}

---@param name string
---@return boolean
local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

---@param sc string
---@param txt string
---@param keybind string?
---@param keybind_opts table?
---@param opts table?
---@return table
function M.button(sc, txt, keybind, keybind_opts, opts)
  local def_opts = {
    cursor = 5,
    align_shortcut = "right",
    hl_shortcut = "AlphaButtonShortcut",
    hl = "AlphaButton",
    width = 35,
    position = "center",
  }
  opts = opts and vim.tbl_extend("force", def_opts, opts) or def_opts
  opts.shortcut = sc
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<Leader>")
  local on_press = function()
    local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end
  if keybind then
    keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
    opts.keymap = { "n", sc_, keybind, keybind_opts }
  end
  return { type = "button", val = txt, on_press = on_press, opts = opts }
end

---@return string
function M.info()
  local plugins = #vim.tbl_keys(require("lazy").plugins())
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  local platform = vim.fn.has "win32" == 1 and "" or ""
  return string.format(" %d   v%d.%d.%d %s  %s", plugins, v.major, v.minor, v.patch, platform, datetime)
end

---@return table
function M.mru()
  local result = {}
  for _, filename in ipairs(vim.v.oldfiles) do
    if file_exists(filename) then
      local icon, hl = require("nvim-web-devicons").get_icon(filename, vim.fn.fnamemodify(filename, ":e"))
      local filename_short = string.sub(vim.fn.fnamemodify(filename, ":t"), 1, 30)
      table.insert(
        result,
        M.button(
          tostring(#result + 1),
          string.format("%s  %s", icon, filename_short),
          string.format("<Cmd>e %s<CR>", filename),
          nil,
          { hl = { { hl, 0, 3 }, { "Normal", 5, #filename_short + 5 } } }
        )
      )
      if #result == 9 then
        break
      end
    end
  end
  return result
end

return M
