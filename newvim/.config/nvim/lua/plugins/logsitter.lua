vim.pack.add({ "https://github.com/gaelph/logsitter.nvim" })

require("logsitter").setup({
  path_format = "fileonly",
  prefix = "[Log]->",
  separator = "->",
})

vim.keymap.set("n", "<leader>l", function() require("logsitter").log() end, { desc = "Logsitter: log current" })
