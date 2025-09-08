require("colors.dracula")

require("core.options")
require("core.commands")

vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp",            version = vim.version.range("1.*") },
  { src = "https://github.com/numToStr/FTerm.nvim" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/MagicDuck/grug-far.nvim" },
  { src = "https://github.com/gaelph/logsitter.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/benomahony/oil-git.nvim" },
  { src = "https://github.com/eero-lehtinen/oklch-color-picker.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/kevinhwang91/nvim-ufo" },
  { src = 'https://github.com/kevinhwang91/promise-async' },
  { src = 'https://github.com/luukvbaal/statuscol.nvim' },
  { src = "https://github.com/mg979/vim-visual-multi" },
  { src= "https://github.com/folke/which-key.nvim" }
})

require("plugins.blink")
require("plugins.fterm")
require("plugins.grugfar")
require("plugins.logsitter")
require("plugins.lsp")
require("plugins.mini")
require("plugins.oil")
require("plugins.oklchcolorpicker")
require("plugins.treesitter")
require("plugins.tsautotag")
require("plugins.ufo")
--require("plugins.visualmulti")
require("plugins.whichkey")

require("core.mappings")
