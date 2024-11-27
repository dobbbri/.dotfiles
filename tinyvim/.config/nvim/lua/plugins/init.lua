return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  { "mg979/vim-visual-multi" },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function() require("plugins.configs.gruvbox") end,
  },

  -- {
  --   "maxmx03/fluoromachine.nvim",
  --   priority = 1000,
  --   config = function() require("plugins.configs.fluoromachine") end,
  -- },

  {
    "chrisgrieser/nvim-tinygit",
    dependencies = "stevearc/dressing.nvim",
    opts = require("plugins.configs.tinygit"),
  },

  {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    opts = {},
  },

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = require("plugins.configs.notify"),
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = require("plugins.configs.nvimtree"),
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugins.configs.treesitter") end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = require("plugins.configs.bufferline"),
  },

  {
    "echasnovski/mini.nvim",
    version = false,
    config = function() require("plugins.configs.mini") end,
  },

  -- we use cmp plugin only when in insert mode
  -- so lets lazyload it at InsertEnter event, to know all the events check h-events
  -- completion , now all of these plugins are dependent on cmp, we load them after cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- cmp sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      --list of default snippets
      "rafamadriz/friendly-snippets",
      -- snippets engine
      {
        "L3MON4D3/LuaSnip",
        config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
      },
      -- autopairs , autocompletes ()[] etc
      {
        "windwp/nvim-autopairs",
        config = function() require("plugins.configs.autopairs") end,
      },
    },
    -- made opts a function cuz cmp config calls cmp module
    -- and we lazyloaded cmp so we dont want that file to be read on startup!
    config = function() require("plugins.configs.cmp") end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function() require("plugins.configs.lspconfig") end,
  },

  {
    "stevearc/conform.nvim",
    lazy = true,
    event = "BufWritePre",
    opts = require("plugins.configs.formatters"),
  },

  {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = "BufWritePre",
    config = function() require("plugins.configs.linters") end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function() require("plugins.configs.indent") end,
  },

  -- files finder etc
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    opts = require("plugins.configs.telescope"),
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.configs.gitsigns"),
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require("plugins.configs.whichkey") end,
  },
}
