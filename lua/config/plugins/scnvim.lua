vim.g.scnvim_postwin_orientation = "h"
vim.g.scnvim_postwin_size = 7
vim.g.scnvim_scdoc = 0
vim.g.scnvim_scdoc_render_prg = "f:\\devel\\Scripts\\pandoc.exe"
vim.g.scnvim_snippet_format = "luasnip"
--vim.g.scnvim_no_mappings = 1

vim.keymap.set("n", "<M-e>", "<Plug>(scnvim-send-block)", { remap = true })
vim.keymap.set("i", "<M-e>", "<C-o><Plug>(scnvim-send-block)", { remap = true })
vim.keymap.set("v", "<M-e>", "<Plug>(scnvim-send-selection)", { remap = true })
vim.keymap.set("n", "<C-e>", "<Plug>(scnvim-send-line)", { remap = true })
vim.keymap.set("i", "<C-e>", "<C-o><Plug>(scnvim-send-line)", { remap = true })

vim.keymap.set("n", "<S-F12>", "<Plug>(scnvim-hard-stop)", { remap = true })
vim.keymap.set("i", "<S-F12>", "<C-o><Plug>(scnvim-hard-stop)", { remap = true })

-- does this work?
vim.keymap.set("n", "<M-k>", "<Plug>(scnvim-show-signature)", { remap = true })
vim.keymap.set("i", "<M-k>", "<C-o><Plug>(scnvim-show-signature)", { remap = true })
