vim.pack.add({ "https://github.com/echasnovski/mini.nvim" }, { confirm = false })

local win_config = function()
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

require("mini.diff").setup({
  config = { view = { style = vim.go.number and 'number' } }
})

require("mini.move").setup({
  mappings = { left = "H", right = "L", down = "J", up = "K" }
})

require("mini.pairs").setup()
require("mini.icons").setup()

require("mini.pick").setup({
  window = { config = win_config() }
})
vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>", { desc = "List files" })
vim.keymap.set("n", "<leader>m", "<cmd>Pick resume<CR>", { desc = "List Pick resume" })
vim.keymap.set("n", "<leader>w", "<cmd>Pick grep_live<CR>", { desc = "Search by word" })
vim.keymap.set("n", "<leader><space>", "<cmd>Pick buffers<CR>", { desc = "List opened buffers" })


-- local ignore_files = {
--   ".DS_Store",
--   ".git",
--   ".astro",
--   ".vscode",
--   ".gitignore",
--   -- "dist",
--   "lazy-lock.json",
--   "package-lock.json",
--   "node_modules",
--   "pnpm-lock.yaml",
-- }

-- require("mini.files").setup({
--   content = { filter = function(entry) return not vim.tbl_contains(ignore_files, entry.name) end },
--   mappings = { close = "q", go_in_plus = "<CR>", go_out_plus = "<left>" },
-- })
-- vim.keymap.set("n", "-", function() require("mini.files").open() end, { desc = "Show File Manager" })
-- vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end, { desc = "Show File Manager" })
