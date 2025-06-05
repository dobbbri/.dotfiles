return {

  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  { "mg979/vim-visual-multi" },

  {
    "ibhagwan/fzf-lua",
    opts = { "ivy", winopts = { height = 0.60, width = 1 } },
  },

  {
    "MagicDuck/grug-far.nvim",
    lazy = true,
    opts = { headerMaxWidth = 80 },
  },

  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = "VeryLazy",
    version = "*",
    opts = {},
  },

  {
    "sschleemilch/slimline.nvim",
    opts = require("plugins.configs.slimline"),
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = require("plugins.configs.indentblankline"),
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = { signcolumn = false, numhl = true },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = { preset = "powerline" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugins.configs.treesitter") end,
  },

  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "1.*",
    lazy = false,
    opts = require("plugins.configs.blink"),
    opts_extend = { "sources.default" },
  },

  {
    "echasnovski/mini.nvim",
    version = false,
    config = function() require("plugins.configs.mini") end,
  },

  {
    "nvimdev/guard.nvim",
    dependencies = { "nvimdev/guard-collection" },
    config = function() require("plugins.configs.guard") end,
  },

  {
    "gaelph/logsitter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { path_format = "fileonly", prefix = "[Log]", separator = ">" },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { preset = "modern", icons = { mappings = false } },
  },
}
