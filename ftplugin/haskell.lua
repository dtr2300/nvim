-- vim.bo.tabstop = 2
-- vim.bo.softtabstop = 2
-- vim.bo.shiftwidth = 2
vim.bo.cindent = true
vim.opt_local.cinkeys:remove "0#"

-- jump to prev/next paragraph
vim.keymap.set("n", "}", "2}{j", { silent = true, buffer = true })
vim.keymap.set("n", "{", "2{j", { silent = true, buffer = true })

-- mappings

if vim.fn.has "win32" == 1 then
  -- toggle sc post window
  vim.keymap.set("n", "<CR>", function()
    require("scnvim.postwin").toggle()
  end, { silent = true, buffer = true, desc = "Toggle sc post window" })

  -- start sc and superdirt
  vim.keymap.set("n", "<S-F5>", function()
    require("tidal").start_superdirt()
  end, { silent = true, buffer = true, desc = "Start sc and superdirt" })

  -- start tidalcycles
  vim.keymap.set("n", "<F5>", function()
    require("tidal").start()
  end, { silent = true, buffer = true, desc = "Start tidalcycles" })

  -- stop tidalcycles and sc
  vim.keymap.set("n", "<F6>", function()
    require("tidal").stop()
  end, { silent = true, buffer = true, desc = "Stop tidalcycles" })

  -- send current paragraph
  vim.keymap.set({ "n", "i" }, "<M-e>", function()
    require("tidal").send_buf()
  end, { silent = true, buffer = true, desc = "Send paragraph" })

  -- send current line
  vim.keymap.set({ "n", "i" }, "<C-e>", function()
    require("tidal").send_buf(false)
  end, { silent = true, buffer = true, desc = "Send line" })

  -- silence please
  vim.keymap.set("n", "<F12>", function()
    require("tidal").send "hush"
  end, { silent = true, buffer = true, desc = "Hush" })

  -- panic
  vim.keymap.set("n", "<S-F12>", function()
    require("tidal").send "panic"
  end, { silent = true, buffer = true, desc = "Panic" })

  -- silence pattern
  vim.keymap.set("n", "<LocalLeader>x", function()
    local i = vim.api.nvim_get_vvar "count1"
    if i <= 16 then
      require("tidal").send(string.format("d%d silence", i))
    end
  end, { silent = true, buffer = true, desc = "Silence pattern" })

  -- mute pattern
  vim.keymap.set("n", "<LocalLeader>m", function()
    local i = vim.api.nvim_get_vvar "count1"
    if i <= 16 then
      require("tidal").send(string.format("mute %d", i))
    end
  end, { silent = true, buffer = true, desc = "Mute pattern" })

  -- unmute pattern
  vim.keymap.set("n", "<LocalLeader>M", function()
    local i = vim.api.nvim_get_vvar "count1"
    if i <= 16 then
      require("tidal").send(string.format("unmute %d", i))
    else
      require("tidal").send "unmuteAll"
    end
  end, { silent = true, buffer = true, desc = "Unmute pattern" })

  -- solo pattern
  vim.keymap.set("n", "<LocalLeader>s", function()
    local i = vim.api.nvim_get_vvar "count1"
    if i <= 16 then
      require("tidal").send(string.format("solo %d", i))
    end
  end, { silent = true, buffer = true, desc = "Solo pattern" })

  -- unsolo pattern
  vim.keymap.set("n", "<LocalLeader>S", function()
    local i = vim.api.nvim_get_vvar "count1"
    if i <= 16 then
      require("tidal").send(string.format("unsolo %d", i))
    else
      require("tidal").send "unsoloAll"
    end
  end, { silent = true, buffer = true, desc = "Unsolo pattern" })

  -- s.plotTree
  vim.keymap.set("n", "<LocalLeader>t", function()
    require("scnvim").send "s.plotTree;"
  end, { silent = true, buffer = true, desc = "s.plotTree" })

  -- s.scope
  vim.keymap.set("n", "<LocalLeader>c", function()
    require("scnvim").send "s.scope;"
  end, { silent = true, buffer = true, desc = "s.scope" })

  -- s.freqscope
  vim.keymap.set("n", "<LocalLeader>f", function()
    require("scnvim").send "s.freqscope;"
  end, { silent = true, buffer = true, desc = "s.freqscope" })

  -- s.makeGui
  vim.keymap.set("n", "<LocalLeader>g", function()
    require("scnvim").send "s.makeGui;"
  end, { silent = true, buffer = true, desc = "s.makeGui" })

  -- s.meter
  vim.keymap.set("n", "<LocalLeader>r", function()
    require("scnvim").send "s.meter;"
  end, { silent = true, buffer = true, desc = "s.meter" })

  -- s.volume.Gui
  vim.keymap.set("n", "<LocalLeader>v", function()
    require("scnvim").send "s.volume.Gui;"
  end, { silent = true, buffer = true, desc = "s.volume.Gui" })
end
