return {
  view = { width = 40 },
  actions = { open_file = { quit_on_open = true } },
  filters = {
    git_ignored = true,
    dotfiles = true,
    custom = { "lazy-lock.json", "package-lock.json", "node_modules", ".DS_Store" },
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "󰓎",
          deleted = "󰍴",
          ignored = "◌",
        },
      },
    },
  },
}
