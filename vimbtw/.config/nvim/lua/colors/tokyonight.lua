vim.pack.add({ "https://github.com/folke/tokyonight.nvim" }, { load = true })

require("tokyonight").setup({
  transparent = false,
})

vim.cmd.colorscheme("tokyonight-night")

vim.cmd.hi("Comment gui=none")
