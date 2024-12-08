return {
  { lazy = true, "nvim-lua/plenary.nvim" },

  { "mg979/vim-visual-multi" },

  -- {
  --   "stevearc/dressing.nvim",
  --   opts = {},
  -- },

  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function() require("plugins.configs.gruvbox") end,
  -- },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function() require("nordic").load() end,
  },
  -- {
  --   "maxmx03/fluoromachine.nvim",
  --   priority = 1000,
  --   config = function() require("plugins.configs.fluoromachine") end,
  -- },

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
    "sschleemilch/slimline.nvim",
    opts = require("plugins.configs.slimline"),
  },

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
    config = function() require("plugins.configs.indentline") end,
  },

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
    "chrisgrieser/nvim-tinygit",
    opts = require("plugins.configs.tinygit"),
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require("plugins.configs.whichkey") end,
  },
}
