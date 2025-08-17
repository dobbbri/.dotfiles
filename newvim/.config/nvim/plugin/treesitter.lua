vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").setup({
  ensure_installed = parser_names(),
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
})
