return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
      transparent_background = false,
      show_end_of_buffer = false,
      integration_default = true,
    })

    vim.api.nvim_command("colorscheme catppuccin")
  end,
}
