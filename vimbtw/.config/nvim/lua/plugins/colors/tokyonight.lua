vim.pack.add({ "https://github.com/folke/tokyonight.nvim" }, {confirm = false})

require("tokyonight").setup({
  transparent = false,
})

vim.cmd.colorscheme('tokyonight-night')

vim.cmd.hi('Comment gui=none')
