return {
  {
    vim.g.selected_colorscheme.package,
    lazy = false,
    priority = 1000,
    config = function()
      require("plugins.configs.cs." .. vim.g.selected_colorscheme.name)
      vim.cmd("colorscheme " .. vim.g.selected_colorscheme.name)
    end,
  },

  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "echasnovski/mini.nvim",
    version = false,
    config = function() require("plugins.configs.mini") end,
  },

  { "mg979/vim-visual-multi" },

  { "ibhagwan/fzf-lua", opts = { "border-fused" } },

  { "MagicDuck/grug-far.nvim", lazy = true, opts = { headerMaxWidth = 80 } },

  { "eero-lehtinen/oklch-color-picker.nvim", event = "VeryLazy", version = "*", opts = {} },

  {
    "fzdwx/bufline.nvim",
    event = "BufEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("plugins.configs.bufline"),
  },

  { "sschleemilch/slimline.nvim", opts = require("plugins.configs.slimline") },


  { "williamboman/mason.nvim", opts = {} },
  { "mason-org/mason-lspconfig.nvim", opts = {} },
  { "neovim/nvim-lspconfig" },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require("plugins.configs.treesitter") end,
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",
    opts = require("plugins.configs.blink"),
    opts_extend = { "sources.default" },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function() require("plugins.configs.formatters") end,
  },

  { "folke/which-key.nvim", event = "VeryLazy", opts = { icons = { mappings = false } } },
}
