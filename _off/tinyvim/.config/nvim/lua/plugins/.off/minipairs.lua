return {
  "echasnovski/mini.pairs",
  version = false,
  config = function()
    require("mini.pairs").setup({
      modes = {
        insert = true,
        command = true,
        terminal = true,
      },
    })
  end,
}
