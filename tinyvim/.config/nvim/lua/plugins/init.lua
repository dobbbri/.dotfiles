return {
  {
    vim.g._color.package,
    lazy = false,
    priority = 1000,
    config = function() require("plugins.colors." .. vim.g._color.name) end,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  { "mg979/vim-visual-multi" },

  { "nvim-tree/nvim-web-devicons" },

  { "stevearc/dressing.nvim", opts = {} },

  { "rcarriga/nvim-notify" },

  { "ibhagwan/fzf-lua", opts = {} },

  { "MeanderingProgrammer/render-markdown.nvim", opts = {} },

  {
    "brenoprata10/nvim-highlight-colors",
    opts = require("plugins.configs.highlightcolors"),
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
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = require("plugins.configs.bufferline"),
  },

  {
    "sschleemilch/slimline.nvim",
    opts = require("plugins.configs.slimline"),
  },

  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = require("plugins.configs.blink"),
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
    config = function() require("plugins.configs.formatters") end,
  },

  -- {
  --   "mfussenegger/nvim-lint",
  --   config = function() require("plugins.configs.linters") end,
  -- },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.configs.gitsigns"),
  },

  {
    "chrisgrieser/nvim-tinygit",
    ft = { "gitrebase", "gitcommit" },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { preset = "classic" },
    config = function() require("plugins.configs.whichkey") end,
  },
}
