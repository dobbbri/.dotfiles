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

vim.pack.add({ "https://github.com/echasnovski/mini.files" })

require("mini.files").setup({
  use_as_default_explorer = false,
  permanent_delete = false,
  content = { filter = function(entry) return not vim.tbl_contains(ignore_files, entry.name) end },
  mappings = { close = "q", go_in_plus = "<CR>", go_out_plus = "<left>" },
})

vim.keymap.set("n", "-", function() require("mini.files").open() end, { desc = "Show File Manager" })
vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end, { desc = "Show File Manager" })
