local colorscheme = {
  { 1, name = "fluoromachine", package = "maxmx03/fluoromachine.nvim" },
  { 2, name = "gruvbox", package = "ellisonleao/gruvbox.nvim" },
  { 3, name = "onedark", package = "navarasu/onedark.nvim" },
  { 4, name = "dracula", package = "Mofiqul/dracula.nvim" },
  { 5, name = "kanagawa", package = "rebelot/kanagawa.nvim" },
}

local selected_colorscheme = colorscheme[4]

return {
  selected_colorscheme.package,
  lazy = false,
  priority = 1000,
  config = function()
    require("plugins.configs.cs." .. selected_colorscheme.name)
    vim.cmd("colorscheme " .. selected_colorscheme.name)
  end,
}
