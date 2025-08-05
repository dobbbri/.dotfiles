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

vim.pack.add({ "https://github.com/echasnovski/mini.pick" })

require("mini.pick").setup({
  window = { config = win_config },
})

vim.keymap.set("n", "<leader>f", "<cmd>Pick files<CR>", { desc = "List files" })
vim.keymap.set("n", "<leader>m", "<cmd>Pick resume<CR>", { desc = "List Pick resume" })
vim.keymap.set("n", "<leader>w", "<cmd>Pick grep_live<CR>", { desc = "Search by word" })
vim.keymap.set("n", "<leader><space>", "<cmd>Pick buffers<CR>", { desc = "List opened buffers" })
