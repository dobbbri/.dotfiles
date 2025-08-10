vim.pack.add({ "https://github.com/chrisgrieser/nvim-origami" })

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require("origami").setup {
  useLspFoldsWithTreesitterFallback = true,
  pauseFoldsOnSearch = true,
  foldtext = {
    enabled = true,
    padding = 3,
    lineCount = {
      template = "%d lines", -- `%d` is replaced with the number of folded lines
      hlgroup = "Comment",
    },
    diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
    gitsignsCount = true,   -- requires `gitsigns.nvim`
  },
  autoFold = {
    enabled = true,
    kinds = { "comment", "imports" },
  },
  foldKeymaps = {
    setup = true, -- modifies `h` and `l`
    hOnlyOpensOnFirstColumn = false,
  },
}

vim.keymap.set("n", "<c-h>", function() require("origami").h() end)
vim.keymap.set("n", "<c-l>", function() require("origami").l() end)
