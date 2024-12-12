return {
  {
    vim.g._color.package,
    config = function() require("plugins.colors." .. vim.g._color.name) end,
    lazy = false,
    priority = 1000,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  { "mg979/vim-visual-multi" },

  { "stevearc/dressing.nvim" },

  { "nvim-tree/nvim-web-devicons" },

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
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
  },

  {
    "stevearc/conform.nvim",
    config = function() require("plugins.configs.formatters") end,
  },

  {
    "mfussenegger/nvim-lint",
    config = function() require("plugins.configs.linters") end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = require("plugins.configs.colorizer"),
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
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
      "rcarriga/nvim-notify",
    },
    ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require("plugins.configs.whichkey") end,
  },
}
