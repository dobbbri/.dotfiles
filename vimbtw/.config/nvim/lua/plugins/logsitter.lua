vim.pack.add({
  { src = "https://github.com/gaelph/logsitter.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" }
}, { confirm = false })

require("logsitter").setup({
  path_format = "fileonly",
  prefix = "[Log]->",
  separator = "->",
})

vim.keymap.set("n", "<leader>l", function() require("logsitter").log() end, { desc = "Logsitter: log current" })
