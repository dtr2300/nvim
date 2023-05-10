local toggleterm = {
  sections = {
    lualine_a = {
      {
        function()
          return "ToggleTerm #" .. vim.b.toggle_number
        end,
        separator = { left = "", right = "" },
      },
    },
  },
  filetypes = { "toggleterm" },
}

local aerial = {
  sections = {
    lualine_a = {
      {
        function()
          return "Aerial"
        end,
        separator = { left = "", right = "" },
      },
    },
  },
  filetypes = { "aerial" },
}

local quickfix = {
  sections = {
    lualine_a = {
      {
        function()
          return (vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0) and "Location List" or "Quickfix List"
        end,
        separator = { left = "", right = "" },
      },
    },
    lualine_b = {
      {
        function()
          if vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0 then
            return vim.fn.getloclist(0, { title = 0 }).title
          end
          return vim.fn.getqflist({ title = 0 }).title
        end,
      },
    },
    lualine_z = {
      {
        "location",
        separator = { left = "", right = "" },
      },
    },
  },
  filetypes = { "qf" },
}

vim.g.qf_disable_statusline = true

local lazy = {
  sections = {
    lualine_a = {
      {
        function()
          return "Lazy 💤"
        end,
        separator = { left = "", right = "" },
      },
    },
    lualine_b = {
      {
        function()
          local stats = require("lazy").stats()
          return "loaded: " .. stats.loaded .. "/" .. stats.count
        end,
      },
    },
    lualine_c = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
      },
    },
  },
  filetypes = { "lazy" },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "ColorScheme",
  opts = {
    options = {
      theme = "catppuccin",
      globalstatus = true,
      component_separators = "",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          separator = { left = "", right = "" },
        },
      },
      lualine_b = {
        {
          "branch",
        },
        {
          "diff",
        },
        {
          "diagnostics",
        },
      },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = {
        {
          "progress",
        },
      },
      lualine_z = {
        {
          "location",
          separator = { left = "", right = "" },
        },
      },
    },
    extensions = { lazy, quickfix, toggleterm, aerial },
  },
}
