require("ibl").setup({
  indent = { char = "│" },
  scope = { char = "│", highlight = "Comment" },
})

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })
