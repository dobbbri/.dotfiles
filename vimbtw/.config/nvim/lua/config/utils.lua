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
      -- Web development
      "astro",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "scss",
      "json",
      -- "jsonc",
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
  end,

  window_config = function()
    local height = 16 -- math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
      anchor = "NW",
      height = height,
      width = width,
      row = 1, -- math.floor(0.5 * (vim.o.lines - height)),
      col = math.floor(0.5 * (vim.o.columns - width)),
    }
  end,

  window_notify_config = function()
    local has_statusline = vim.o.laststatus > 0
    local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
    return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - pad }
  end,
}

return M
