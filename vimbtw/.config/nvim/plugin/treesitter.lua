vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
  -- "https://github.com/gaelph/logsitter.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
}, { confirm = false })

local parsers = { "astro", "javascript", "typescript", "tsx", "html", "css", "json", "lua", "markdown", "yaml" }

require("nvim-treesitter").install(vim.tbl_keys(parsers))
require("treesitter-context").setup({ enable = true })
require("nvim-ts-autotag").setup({})
require("render-markdown").setup({})

-- local logss = require("logsitter")
-- logss.setup({ path_format = "fileonly", prefix = "[Log]->", separator = "->" })
--
-- vim.keymap.set("n", "<leader>l", function() logss.log() end, { desc = "Logsitter: log current" })

vim.api.nvim_create_augroup("TSGroup", {})
vim.api.nvim_create_autocmd("BufEnter", {
  group = "TSGroup",
  callback = function() pcall(vim.treesitter.start) end,
})
