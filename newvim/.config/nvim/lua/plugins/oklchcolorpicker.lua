vim.pack.add({ "https://github.com/eero-lehtinen/oklch-color-picker.nvim" })

require("oklch-color-picker").setup()

vim.keymap.set(
  "n",
  "<leader>c",
  function() require("oklch-color-picker").pick_under_cursor() end,
  { desc = "Color pick under cursor" }
)
