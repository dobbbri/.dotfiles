vim.pack.add({ "https://github.com/sschleemilch/slimline.nvim" }, { confirm = false })

require("slimline").setup({
  style = "fg",
  bold = true,
  configs = {
    path = {
      hl = { primary = "Label" },
    },
    git = {
      hl = { primary = "Function" },
    },
    diagnostics = {
      icons = { HINT = '󰛨 ' },
    },
    filetype_lsp = {
      hl = { primary = "String" },
    },
  },
})
