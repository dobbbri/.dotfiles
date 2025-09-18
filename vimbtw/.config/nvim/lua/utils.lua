local M = {

  ignore_files = function()
    return {
      ".DS_Store",
      ".git",
      ".astro",
      ".vscode",
      ".gitignore",
      -- "dist",
      "lazy-lock.json",
      "package-lock.json",
      "node_modules",
      "pnpm-lock.yaml",
    }
  end,

  parser_names = function()
    return {
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
  end,

  window_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
      anchor = "NW",
      height = height,
      width = width,
      row = math.floor(0.5 * (vim.o.lines - height)),
      col = math.floor(0.5 * (vim.o.columns - width)),
    }
  end,

}

return M
