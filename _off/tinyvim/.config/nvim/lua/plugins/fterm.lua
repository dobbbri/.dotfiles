return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup({
      hl = 'FloatBorder',
      dimensions = {
        height = 0.9,
        width = 0.8,
      },
    })
  end,
}
