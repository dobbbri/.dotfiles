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

require("mini.icons").setup()
require("mini.files").setup({
  permanent_delete = false,
  content = { filter = function(entry) return not vim.tbl_contains(ignore_files, entry.name) end },
  mappings = { close = "q", go_in_plus = "<CR>", go_out_plus = "<left>" },
})
require("mini.move").setup({ mappings = { left = "H", right = "L", down = "J", up = "K" } })
require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })
require("mini.indentscope").setup({ symbol = "│" })
require("mini.comment").setup()
require("mini.diff").setup()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#8ebd6b" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#e2b86b" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#e55561" })

    vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { link = "GitSignsAdd" })
    vim.api.nvim_set_hl(0, "MiniDiffSignChange", { link = "GitSignsChange" })
    vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { link = "GitSignsDelete" })
  end,
})
