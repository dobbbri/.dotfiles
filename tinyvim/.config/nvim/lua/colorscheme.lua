local colorscheme = {
  { 1, name = "fluoromachine", package = "maxmx03/fluoromachine.nvim" },
  { 2, name = "gruvbox", package = "ellisonleao/gruvbox.nvim" },
  { 3, name = "onedark", package = "navarasu/onedark.nvim" },
  { 4, name = "dracula", package = "Mofiqul/dracula.nvim" },
  { 5, name = "kanagawa", package = "rebelot/kanagawa.nvim" },
}

local selected = 3

return {
  colorscheme[selected].package,
  lazy = false,
  priority = 1000,
  config = function()
    require("plugins.configs.cs." .. colorscheme[selected].name)
    vim.cmd("colorscheme " .. colorscheme[selected].name)
  end,
}
