function _G.P(...)
  local objects = {}
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end
  print(table.concat(objects, "\n"))
  return ...
end

function _G.RELOAD(...)
  return require("plenary.reload").reload_module(...)
end

function _G.R(name)
  RELOAD(name)
  return require(name)
end
