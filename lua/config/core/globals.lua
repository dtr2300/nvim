function _G.RELOAD(...)
  return require("plenary.reload").reload_module(...)
end

function _G.R(name)
  RELOAD(name)
  return require(name)
end
