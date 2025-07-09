require("options")
require("commands")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.colorschemes.catppuccin" },
  { import = "plugins" },
}, {
  defaults = { lazy = false },
  -- install = { colorscheme = { "onedark" } },
  -- checker = { enabled = false },
  -- concurrency = 10,
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tutor",
        "zipPlugin",
      },
    },
  },
  debug = false,
})

require("mappings")
