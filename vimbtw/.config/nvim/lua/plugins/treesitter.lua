vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main", data = { build = ":TSUpdate" } },
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  -- "https://github.com/gaelph/logsitter.nvim",
}, { confirm = false })

local filetypes = {
  -- Web development
  "astro",
  "javascript",
  "typescript",
  "tsx",
  "html",
  "css",
  "scss",
  "json",
  "jsonc",
  "vue",
  "c",

  -- Languages
  "lua",
  "go",
  "php",
  "python",
  "rust",
  "bash",

  -- Markup and config
  "markdown_inline",
  "markdown",
  "yaml",
  "toml",

  -- Git related
  "git_config",
  "git_rebase",
  "gitcommit",
  "gitignore",

  -- Other utilities
  "regex",
  "vim",
  "vimdoc",
  "query",
  "diff",
  "luadoc",
}

require("nvim-treesitter").install(filetypes)

require("nvim-ts-autotag").setup({})
require("render-markdown").setup({})

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"

vim.api.nvim_create_autocmd("FileType", {
  -- pattern = filetypes,
  pattern = { "<filetype>" },
  callback = function() vim.treesitter.start() end,
})

-- local logss = require("logsitter")
-- logss.setup({ path_format = "fileonly", prefix = "[Log]->", separator = "->" })
-- vim.keymap.set("n", "<leader>l", function() logss.log() end, { desc = "Logsitter: log current" })

-- require'nvim-treesitter'.install { "astro", "javascript", "typescript", "tsx", "json", "yaml" }
-- require("nvim-treesitter").setup({
--   modules = {},
--   sync_install = true,
--   ignore_install = { "jsonc" },
--   auto_install = true,
--   highlight = { enable = true },
--   indent = { enable = true },
-- })
