return {
  "prichrd/netrw.nvim",
  config = function()
    require("netrw").setup({
      icons = {
        symlink = "",
        directory = "",
        file = "",
      },
    })
  end,
  opts = {},
}
