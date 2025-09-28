vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" }
})

require("mason").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "astro-language-server",
    "bash-language-server",
    "json-lsp",
    "lua-language-server",
    "prettier",
    "shfmt",
    "stylua",
    "tailwindcss-language-server",
    "typescript-language-server"
  }
})
