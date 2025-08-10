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

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = parser_names,
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    })
  end,
}
