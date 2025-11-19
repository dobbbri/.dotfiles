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
      icons = { ERROR = " ", WARN = "󰀨 ", INFO = " ", HINT = "󰠠 " },
    },
    filetype_lsp = {
      hl = { primary = "String" },
    },
   progress = {
      follow = 'label',
      column = true, -- Enables a secondary section with the cursor column
    },
  },
})
