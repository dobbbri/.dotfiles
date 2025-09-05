vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/benomahony/oil-git.nvim" }
})

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

require("oil").setup {
  columns = { "icon" },
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-k>"] = false,
    ["<C-j>"] = false,
    ["<M-h>"] = "actions.select_split",
    ["q"] = { "actions.close", mode = "n" },
  },
  float = {
    max_width = 0.4,
    max_height = 0.8,
    border = "single"
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return vim.tbl_contains(ignore_files, name)
    end,
  },
}

vim.keymap.set("n", "-", require("oil").toggle_float, { desc = "Show File Manager" })
