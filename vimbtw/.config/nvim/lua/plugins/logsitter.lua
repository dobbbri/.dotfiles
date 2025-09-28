vim.pack.add({
  { src = "https://github.com/gaelph/logsitter.nvim" },
})

local logs = require("logsitter")

logs.setup({
  path_format = "fileonly",
  prefix = "[Log]->",
  separator = "->",
})

vim.keymap.set("n", "<leader>l", function() logs.log() end, { desc = "Logsitter: log current" })
