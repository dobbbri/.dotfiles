vim.pack.add({
  { src = "https://github.com/gaelph/logsitter.nvim" },
})

local logss = require("logsitter")

logss.setup({
  path_format = "fileonly",
  prefix = "[Log]->",
  separator = "->",
})

vim.keymap.set("n", "<leader>l", function() logss.log() end, { desc = "Logsitter: log current" })
