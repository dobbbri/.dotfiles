vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })

require("tokyonight").setup({
  transparent = false,
})

vim.cmd.colorscheme('tokyonight-night')

vim.cmd.hi('Comment gui=none')
