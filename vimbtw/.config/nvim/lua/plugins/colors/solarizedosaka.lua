vim.pack.add({"https://github.com/craftzdog/solarized-osaka.nvim"}, { onfirm = vim.g.pack_confirm})

require("solarized-osaka").setup({
  transparent = false,
  styles = { keywords = { italic = false } },
})

vim.cmd.colorscheme("solarized-osaka")
