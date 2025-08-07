local M = {}

M.ignore_files = function()
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
end

M.win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = "NW",
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

M.parser_names = function()
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
end

M.load_plugins = function(path)
  local config_path = vim.fn.stdpath("config") .. path .. "/"
  print(config_path)

  for _, file in ipairs(vim.fn.readdir(config_path, [[v:val =~ '\.lua$']])) do
    local plugin = "." .. config_path .. file:gsub("%.lua$", "")
    print(plugin)
    require(plugin)
  end
end

return M
