local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup {
  mapping = {
    ["<Down>"] = cmp.mapping {
      i = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      c = function(fallback)
        cmp.close()
        vim.schedule(cmp.suspend())
        fallback()
      end,
    },

    ["<Up>"] = cmp.mapping {
      i = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      c = function(fallback)
        cmp.close()
        vim.schedule(cmp.suspend())
        fallback()
      end,
    },

    ["<C-d>"] = cmp.mapping.scroll_docs(-4),

    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    ["<C-x>"] = cmp.mapping.close(),

    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { "i", "c" }
    ),

    ["<C-Space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },

    ["<Tab>"] = cmp.config.disable,

    ["<C-q>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },

  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer" },
  },

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find "^_+"
        local _, entry2_under = entry2.completion_item.label:find "^_+"
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },

  view = {
    entries = "",
  },

  experimental = {
    ghost_text = false,
  },

  window = {
    documentation = cmp.config.window.bordered(),
  },
}
