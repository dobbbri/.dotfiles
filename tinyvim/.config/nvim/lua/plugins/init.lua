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

  { "mg979/vim-visual-multi" },

  { "ibhagwan/fzf-lua", opts = { "ivy", winopts = { height = 0.60, width = 1 } } },

  { "MagicDuck/grug-far.nvim", lazy = true, opts = { headerMaxWidth = 80 } },

  { "eero-lehtinen/oklch-color-picker.nvim", event = "VeryLazy", version = "*", opts = {} },

  { "sschleemilch/slimline.nvim", opts = require("plugins.configs.slimline") },

  { "nvimdev/indentmini.nvim", event = "BufEnter", opts = { char = "│", exclude = { "markdown" } } }, --│┊⁚

  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },

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
    config = function(_, opts)
      require("blink.cmp").setup(opts)
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
    end,
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
    opts = { path_format = "fileonly", prefix = "[LS]", separator = ">" },
  },

  { "folke/which-key.nvim", event = "VeryLazy", opts = { preset = "modern", icons = { mappings = false } } },
}
