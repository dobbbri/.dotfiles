vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = vim.g.pack_confirm })

require("which-key").setup({
  icons = { mappings = false },
})
