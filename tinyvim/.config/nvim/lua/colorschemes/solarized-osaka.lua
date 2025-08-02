return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  init = function() vim.opt.background = "dark" end,
  config = function()
    require("solarized-osaka").setup({
      transparent = false,
      styles = { keywords = { italic = false } },
    })
    vim.cmd.colorscheme("solarized-osaka")
  end,
}
