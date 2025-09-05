vim.pack.add({ { src = "https://github.com/rose-pine/neovim", name = "rose-pine" } })

require("rose-pine").setup({
  variant = "main",      -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  -- disable_background = true,
  -- 	disable_nc_background = false,
  disable_float_background = false,
  -- extend_background_behind_borders = false,
  styles = {
    bold = true,
    italic = false,
    transparency = false,
  },
  highlight_groups = {
    PmenuSel = { bg = "#4a465d", fg = "#f8f5f2" },
  },
  enable = {
    terminal = true,
    legacy_highlights = false,
    migrations = true,
  },
})

vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
