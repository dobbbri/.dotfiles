vim.pack.add({ "https://github.com/echasnovski/mini.nvim" }, {  confirm = vim.g.pack_confirm })

local utils = require("utils")

require("mini.diff").setup({
  config = { view = { style = vim.go.number and 'number' } }
})

require("mini.move").setup({
  mappings = { left = "H", right = "L", down = "J", up = "K" }
})

require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.trailspace").setup()

local files = require("mini.files")

files.setup({
  content = { filter = function(entry) return not vim.tbl_contains(utils.ignore_files(), entry.name) end },
  mappings = { close = "q", go_in_plus = "<CR>", go_out_plus = "<left>" },
})
vim.keymap.set("n", "-", function() files.open() end, { desc = "Show File Manager" })
vim.keymap.set("n", "<leader>e", function() files.open() end, { desc = "Show File Manager" })

require("mini.pick").setup({
  window = { config = utils.window_config() }
})
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>", { desc = "List files" })
vim.keymap.set("n", "<leader>m", "<cmd>Pick resume<CR>", { desc = "List Pick resume" })
vim.keymap.set("n", "<leader>w", "<cmd>Pick grep_live<CR>", { desc = "Search by word" })
vim.keymap.set("n", "<leader><space>", "<cmd>Pick buffers<CR>", { desc = "List opened buffers" })
