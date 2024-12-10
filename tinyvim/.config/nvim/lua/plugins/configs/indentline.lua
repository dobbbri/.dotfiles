local char_styles = { "│", "|", "¦", "┆", "┊", "▏", "⎸" }

require("ibl").overwrite({
  indent = { char = char_styles[1] },
  scope = {
    char = char_styles[1],
    enabled = true,
    show_start = false,
  },
  whitespace = { remove_blankline_trail = false },
})
