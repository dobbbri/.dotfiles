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

M.load_plugins = function(plugins_path)
  package.path = package.path .. ";?.lua;" .. plugins_path .. "/?.lua"

  local function is_lua_file(name)
    return name:sub(-4) == ".lua"
  end

  local handle = vim.loop.fs_scandir(plugins_path)
  if not handle then
    print("Pasta de plugins não encontrada: " .. plugins_path)
    return
  end

  while true do
    local name = vim.loop.fs_scandir_next(handle)
    if not name then break end
    if is_lua_file(name) then
      local plugin_name = name:gsub("%.lua$", "")
      -- print("Carregando plugin:", plugin_name)
      local require_path = plugins_path:gsub("/", ".") .. "." .. plugin_name
      require(require_path)
    end
  end
end

return M
