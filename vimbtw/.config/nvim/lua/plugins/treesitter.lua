vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master", build = ":TSUpdate" },
})

local utils = require("config.utils")

require("nvim-treesitter.configs").setup({
  modules = {}, -- You can specify modules here if needed
  sync_install = false, -- Set to true to install parsers synchronously
  ignore_install = { "jsonc" }, -- List of parsers to ignore during installation
  auto_install = true, -- Set to true to automatically install missing parsers
  ensure_installed = utils.parser_names(),
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
})
