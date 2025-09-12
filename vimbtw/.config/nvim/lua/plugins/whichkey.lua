vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

require("which-key").setup({
  preset = "modern",
  icons = { mappings = false },
})
