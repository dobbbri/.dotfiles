vim.pack.add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" })

require("tiny-inline-diagnostic").setup({
  -- Available options: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
  preset = "simple",
  signs = {
    left = "", -- Left border character
    right = "", -- Right border character
    diag = "", -- Diagnostic indicator character
    arrow = "", -- Arrow pointing to diagnostic
    up_arrow = "", -- Upward arrow for multiline
    vertical = " │", -- Vertical line for multiline
    vertical_end = " └", -- End of vertical line for multiline
  },
})
