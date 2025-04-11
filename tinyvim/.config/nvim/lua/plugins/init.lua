return {
  {
    vim.g.selected_color.package,
    lazy = false,
    priority = 1000,
    config = function() require("plugins.configs.cs." .. vim.g.selected_color.name) end,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "echasnovski/mini.nvim",
    version = false,
    config = function() require("plugins.configs.mini") end,
  },

  { "mg979/vim-visual-multi" },

  { "ibhagwan/fzf-lua", opts = {} },

  { "MagicDuck/grug-far.nvim", lazy = true, opts = {} },

  {
    "uga-rosa/ccc.nvim",
    lazy = true,
    ft = { "astro", "css", "javascript", "typescript" },
    opts = require("plugins.configs.ccc"),
  },

  -- {
  --   "sontungexpt/url-open",
  --   branch = "mini",
  --   event = "VeryLazy",
  --   config = function() require("plugins.configs.urlopen") end,
  -- },

  -- {
  --   "mfussenegger/nvim-lint",
  --   events = { "BufWritePost", "BufReadPost", "InsertLeave" },
  --   config = function() require("plugins.configs.linters") end,
  -- },

  {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = require("plugins.configs.bufferline"),
  },

  -- {
  --   "windwp/nvim-ts-autotag",
  --   event = "InsertEnter",
  --   config = function() require("plugins.configs.autotag") end,
  -- },

  -- { "nvim-tree/nvim-tree.lua", opts = require("plugins.configs.tree") },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugins.configs.treesitter") end,
  },

  { "sschleemilch/slimline.nvim", opts = require("plugins.configs.slimline") },

  {
    "saghen/blink.cmp",
    version = "1.*",
    -- event = "InsertEnter",
    dependencies = "rafamadriz/friendly-snippets",
    opts = require("plugins.configs.blink"),
    opts_extend = { "sources.default" },
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   version = false, -- last release is way too old
  --   event = "InsertEnter",
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-cmdline",
  --     "L3MON4D3/LuaSnip",
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --   config = function() require("plugins.configs.cmp") end,
  -- },

  { "williamboman/mason.nvim", opts = {} },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    -- dependencies = { "hrsh7th/cmp-nvim-lsp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function() require("plugins.configs.lspconfig") end,
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function() require("plugins.configs.formatters") end,
  },

  -- {
  --   "lewis6991/gitsigns.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = require("plugins.configs.gitsigns"),
  -- },

  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   opts = { preset = "classic" },
  --   config = function() require("plugins.configs.whichkey") end,
  -- },
}
