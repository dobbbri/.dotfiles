vim.pack.add({ "https://gitlab.com/motaz-shokry/gruvbox.nvim" }, {load = true})

require("gruvbox").setup({
  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },
})

-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme gruvbox-hard")
-- vim.cmd("colorscheme gruvbox-medium")
-- vim.cmd("colorscheme gruvobx-soft")
-- vim.cmd("colorscheme gruvobx-light")
