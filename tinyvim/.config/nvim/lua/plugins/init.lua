return {
  {
    vim.g._color.package,
    config = function() require("plugins.colors." .. vim.g._color.name) end,
    lazy = false,
    priority = 1000,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  { "mg979/vim-visual-multi" },

  { "nvim-tree/nvim-web-devicons" },

  { "stevearc/dressing.nvim" },

  { "rcarriga/nvim-notify" },

  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      enable_named_colors = false,
      enable_tailwind = true,
    },
  },

  {
    "sontungexpt/url-open",
    branch = "mini",
    event = "VeryLazy",
    config = function() require("plugins.configs.urlopen") end,
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
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    opts = require("plugins.configs.blink"),
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {},
  },

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

  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   event = "BufReadPre",
  --   opts = require("plugins.configs.colorizer"),
  -- },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = require("plugins.configs.gitsigns"),
  },

  {
    "chrisgrieser/nvim-tinygit",
    ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function() require("plugins.configs.whichkey") end,
  },
}
