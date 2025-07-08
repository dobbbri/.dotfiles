return {
  "echasnovski/mini.move",
  version = false,
  config = function()
    require("mini.move").setup({
      mappings = {
        left = "H",
        right = "L",
        down = "J",
        up = "K",
      },
    })
  end,
}
