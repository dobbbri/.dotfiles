vim.pack.add({
  { src = "https://github.com/echasnovski/mini.nvim" },
})

local utils = require("config.utils")

require("mini.diff").setup({
  config = { view = { style = vim.go.number and "number" } },
})

require("mini.move").setup({
  mappings = { left = "H", right = "L", down = "J", up = "K" },
})

require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.trailspace").setup()
-- require("mini.git").setup()

-- require("mini.notify").setup({
--   lsp_progress = { enable = false },
--   window = { config = utils.window_notify_config() },
-- })

local files = require("mini.files")

files.setup({
  content = { filter = function(entry) return not vim.tbl_contains(utils.ignore_files(), entry.name) end },
  mappings = { close = "q", go_in_plus = "<CR>", go_out_plus = "<left>" },
})
vim.keymap.set("n", "-", function() files.open() end, { desc = "Show File Manager" })
vim.keymap.set("n", "<leader>e", function() files.open() end, { desc = "Show File Manager" })

require("mini.pick").setup({
  options = { use_cache = true },
  window = { config = utils.window_config() },
})

vim.ui.select = require("mini.pick").ui_select

-- vim.keymap.set("n", "-", "<cmd>Pick files<CR>", { desc = "List files" })
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>", { desc = "List files" })
vim.keymap.set("n", "<leader>m", "<cmd>Pick resume<CR>", { desc = "List Pick resume" })
vim.keymap.set("n", "<leader>w", "<cmd>Pick grep_live<CR>", { desc = "Search by word" })
vim.keymap.set("n", "<leader><space>", "<cmd>Pick buffers<CR>", { desc = "List opened buffers" })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "MiniFilesTitle", { link = "MiniFilesBorder" })
    vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { link = "MiniFilesBorder" })
    vim.api.nvim_set_hl(0, "MiniPickBorderText", { link = "MiniPickBorder" })
    vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "MiniPickBorder" })
  end,
})
