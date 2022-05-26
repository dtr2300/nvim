local parsers = require "nvim-treesitter.parsers"
local tsrainbow_enabled_list = { "lua", "supercollider", "json" }

require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  ignore_install = { "elm", "foam", "fortran", "hack", "help", "slint", "todotxt", "verilog" },
  highlight = {
    enable = true,
  },

  textobjects = {

    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        -- Or you can define your own textobjects like this
        --["iF"] = {
        --  python = "(function_definition) @function",
        --  cpp = "(function_definition) @function",
        --  c = "(function_definition) @function",
        --  java = "(method_declaration) @function",
        --},
      },
    },

    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },

    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },

    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer",
      },
    },
  },

  rainbow = {
    enable = true,
    disable = vim.tbl_filter(function(p)
      local disable = true
      for _, lang in pairs(tsrainbow_enabled_list) do
        if p == lang then
          disable = false
        end
      end
      return disable
    end, parsers.available_parsers()),
    extended_mode = true,
    max_file_lines = nil,
  },
}
