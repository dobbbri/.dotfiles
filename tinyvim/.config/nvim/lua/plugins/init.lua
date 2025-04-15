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

  {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = require("plugins.configs.bufferline"),
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugins.configs.treesitter") end,
  },

  { "sschleemilch/slimline.nvim", opts = require("plugins.configs.slimline") },

  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
    opts = require("plugins.configs.blink"),
    opts_extend = { "sources.default" },
  },

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
}
