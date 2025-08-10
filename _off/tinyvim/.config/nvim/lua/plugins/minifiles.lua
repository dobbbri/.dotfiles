local ignore_files = {
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

return {
  "echasnovski/mini.files",
  version = false,
  config = function()
    local MiniFiles = require("mini.files")
    MiniFiles.setup({
      use_as_default_explorer = false,
      permanent_delete = false,
      content = { filter = function(entry) return not vim.tbl_contains(ignore_files, entry.name) end },
      mappings = { close = "q", go_in_plus = "<CR>", go_out_plus = "<left>" },
    })
  end,
}
