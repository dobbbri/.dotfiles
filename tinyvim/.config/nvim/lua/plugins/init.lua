return {
  {
    vim.g.selected_color.package,
    lazy = false,
    priority = 1000,
    config = function() require("plugins.configs.cs." .. vim.g.selected_color.name) end,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  { "nvim-tree/nvim-web-devicons" },

  { "mg979/vim-visual-multi" },

  -- { "rcarriga/nvim-notify" },

  { "ibhagwan/fzf-lua", opts = {} },

  -- { "MagicDuck/grug-far.nvim", opts = {} },

  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "BufReadPre",
  --   opts = require("plugins.configs.bufferline"),
  -- },

  -- {
  --   "mfussenegger/nvim-lint",
  --   events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  --   config = function() require("plugins.configs.linters") end,
  -- },

  {
    "uga-rosa/ccc.nvim",
    lazy = true,
    ft = { "astro", "css", "javascript", "typescript" },
    opts = require("plugins.configs.ccc"),
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function() require("plugins.configs.autotag") end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    config = function() require("plugins.configs.urlopen") end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = require("plugins.configs.tree"),
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugins.configs.treesitter") end,
  },

  {
    "sschleemilch/slimline.nvim",
    opts = require("plugins.configs.slimline"),
  },

  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = "rafamadriz/friendly-snippets",
    opts = require("plugins.configs.blink"),
    opts_extend = { "sources.default" },
  },

  { "williamboman/mason.nvim", opts = {} },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function() require("plugins.configs.lspconfig") end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function() require("plugins.configs.formatters") end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.configs.gitsigns"),
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { preset = "classic" },
    config = function() require("plugins.configs.whichkey") end,
  },
}
