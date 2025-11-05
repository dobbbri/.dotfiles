vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
}, { confirm = false })

local parsers = { "astro", "javascript", "typescript", "tsx", "html", "css", "json", "lua", "markdown", "yaml" }

require("nvim-treesitter.configs").setup({
  modules = {}, -- You can specify modules here if needed
  sync_install = false, -- Set to true to install parsers synchronously
  ignore_install = { "jsonc" }, -- List of parsers to ignore during installation
  auto_install = true, -- Set to true to automatically install missing parsers
  ensure_installed = parsers,
  highlight = { enable = true },
  indent = { enable = true },
})
