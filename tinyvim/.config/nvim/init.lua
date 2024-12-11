local _colors = {
  { name = "fluoromachine", package = "maxmx03/fluoromachine.nvim" },
  { name = "gruvbox", package = "ellisonleao/gruvbox.nvim" },
  { name = "nordic", package = "alexvzyl/nordic.nvim" },
}
vim.g._color = _colors[1]

require("options")
require("mappings")
require("commands")

-- bootstrap plugins & lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- path where its going to be installed

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

local plugins = require("plugins")

require("lazy").setup(plugins, { install = { colorscheme = { vim.g._color.name } } })

vim.cmd("colorscheme " .. vim.g._color.name)

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })
