vim.pack.add({ "https://github.com/MagicDuck/grug-far.nvim" })

require("grug-far").setup({
  headerMaxWidth = 80,
  showCompactInputs = true,
  showInputsTopPadding = false,
  showInputsBottomPadding = false,
})

vim.keymap.set({ "n", "v" }, "<leader>S", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = { filesFilter = ext and ext ~= "" and "*." .. ext or nil, },
  })
end, { desc = "Search and replace in project" })
