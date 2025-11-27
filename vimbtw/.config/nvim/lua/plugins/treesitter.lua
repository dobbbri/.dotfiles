vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" },
  "https://github.com/gaelph/logsitter.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
}, { confirm = false })

require("nvim-treesitter.configs").setup({
  modules = {},
  sync_install = true,
  ignore_install = { "jsonc" },
  auto_install = true,
  ensure_installed = { "astro", "javascript", "typescript", "tsx", "json", "yaml" },
  highlight = { enable = true },
  indent = { enable = true },
})

require("nvim-ts-autotag").setup({})
require("render-markdown").setup({})

local logss = require("logsitter")
logss.setup({ path_format = "fileonly", prefix = "[Log]->", separator = "->" })

vim.keymap.set("n", "<leader>l", function() logss.log() end, { desc = "Logsitter: log current" })

-- local parsers = {
-- Web development
-- "astro",
-- "javascript",
-- "typescript",
-- "tsx",
-- "html",
-- "css",
-- "scss",
-- "json",
-- "jsonc",
-- "vue",
-- "c",

-- Languages
-- "lua",
-- "go",
-- "php",
-- "python",
-- "rust",
-- "bash",

-- Markup and config
-- "markdown_inline",
-- "markdown",
-- "yaml",
-- "toml",

-- Git related
-- "git_config",
-- "git_rebase",
-- "gitcommit",
-- "gitignore",

-- Other utilities
-- "regex",
-- "vim",
-- "vimdoc",
-- "query",
-- "diff",
-- "luadoc",
-- }
