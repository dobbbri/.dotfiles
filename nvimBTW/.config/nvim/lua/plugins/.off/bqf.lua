vim.pack.add({ "https://github.com/kevinhwang91/nvim-bqf" }, { confirm = false })

require("bqf").setup({
  preview = { winblend = 0 },
})
