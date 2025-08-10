return {
  "echasnovski/mini.diff",
  version = false,
  config = function()
    require("mini.diff").setup({
      config = { view = { style = vim.go.number and 'number' } },
    })
  end,
}
