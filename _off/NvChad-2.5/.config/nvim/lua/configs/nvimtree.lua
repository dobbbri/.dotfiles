-- vim.cmd([[ :hi NvimTreeCursorLine  gui=bold  guifg=#ffffff guibg=#36464f ]])

local options = {
  view = { width = 40 },
  actions = { open_file = { quit_on_open = true } },
  filters = {
    git_ignored = true,
    dotfiles = true,
    custom = { "lazy-lock.json", "package-lock.json", "node_modules", ".DS_Store" },
  },
}

return options
