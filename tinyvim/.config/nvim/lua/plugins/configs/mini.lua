local ignore_files = {
  ".DS_Store",
  ".git",
  ".astro",
  ".vscode",
  ".gitignore",
  "dist",
  "lazy-lock.json",
  "package-lock.json",
  "node_modules",
  "pnpm-lock.yaml",
}

require("mini.files").setup({
  permanent_delete = false,
  content = { filter = function(entry) return not vim.tbl_contains(ignore_files, entry.name) end },
  mappings = { go_in_plus = "<CR>", go_out_plus = "<left>" },
})

require("mini.move").setup({ mappings = { left = "H", right = "L", down = "J", up = "K" } })
require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })
require("mini.indentscope").setup({ symbol = "┊" })
require("mini.comment").setup()
require("mini.icons").setup()
