-- vim.pack.add({ "https://github.com/numToStr/FTerm.nvim" })

require("FTerm").setup({
  hl = "FloatBorder",
  dimensions = { height = 0.9, width = 0.8 },
})

vim.keymap.set("n", "<leader>t", "<cmd>lua require('FTerm').toggle()<CR>", { desc = "Terminal Toggle" })
vim.keymap.set("t", "<leader>t", "<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>", { desc = "Terminal Toggle" })
