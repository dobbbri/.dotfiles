vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local parser_names = {
  "vim",
  "lua",
  "vimdoc",
  "astro",
  "bash",
  "c",
  "diff",
  "html",
  "luadoc",
  "css",
  "scss",
  "html",
  -- "vue",
  "javascript",
  "typescript",
  "json",
  "tsx",
  "yaml",
  "bash",
  "markdown",
  "markdown_inline",
  "gitignore",
  "gitcommit",
  "git_rebase",
  "gitignore",
  "regex",
  "query",
}

require("nvim-treesitter").setup({
  ensure_installed = parser_names,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
})
