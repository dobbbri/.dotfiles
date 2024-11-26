-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/plugins/init.lua

return {
  { "nvim-lua/plenary.nvim" },
  { "mg979/vim-visual-multi" },
  { "nvim-pack/nvim-spectre" },
  { "nvchad/minty", enable = false },
  { "chrisgrieser/nvim-tinygit", opts = function() return require("configs.tinygit") end },
  { "sontungexpt/url-open", branch = "mini", event = "VeryLazy", opts = {} },
  { "rcarriga/nvim-notify", event = "VeryLazy", opts = function() return require("configs.notify") end },
  { "nvim-tree/nvim-tree.lua", opts = function() return require("configs.nvimtree") end },
  { "neovim/nvim-lspconfig", config = function() require("configs.lspconfig") end },
  { "nvim-treesitter/nvim-treesitter", opts = function() return require("configs.treesitter") end },
  { "stevearc/conform.nvim", event = "BufWritePre", opts = function() return require("configs.formatters") end },
  { "mfussenegger/nvim-lint", event = "BufWritePre", config = function() require("configs.linters") end },
  { "lewis6991/gitsigns.nvim", event = "User FilePost", opts = function() return require("configs.gitsigns") end },
  { "echasnovski/mini.nvim", version = false, config = function() require("configs.minimove") end },
  { "folke/which-key.nvim", event = "VeryLazy", config = function() require("configs.whichkey") end },
}
