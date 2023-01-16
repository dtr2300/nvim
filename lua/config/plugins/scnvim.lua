return {
  {
    "davidgranstrom/scnvim",
    enabled = vim.fn.has "win32" == 1,
    ft = "supercollider",
    config = function()
      local scnvim = require "scnvim"
      local map = scnvim.map
      local map_expr = scnvim.map_expr

      scnvim.setup {
        -- ensure_installed = false,
        keymaps = {
          ["<C-e>"] = map("editor.send_line", { "i", "n" }),
          ["<M-e>"] = {
            map("editor.send_block", { "i", "n" }),
            map("editor.send_selection", "x"),
          },
          ["<CR>"] = map "postwin.toggle",
          ["<M-CR>"] = map("postwin.toggle", "i"),
          ["<M-L>"] = map("postwin.clear", { "n", "i" }),
          ["<C-k>"] = map("signature.show", { "n", "i" }),
          ["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
          ["<F5>"] = map "sclang.start",
          ["<S-F5>"] = map_expr "s.waitForBoot { s.volume = -12 }",
          ["<F6>"] = map "sclang.stop",
        },
        editor = {
          highlight = {
            color = "SCNvimEval",
          },
        },
        postwin = {
          float = {
            enabled = true,
            config = {
              border = "rounded",
            },
          },
        },
      }
    end,
  },
}
