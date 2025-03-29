return {
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
  },
  completion = {
    documentation = {
      window = { border = "rounded" },
    },
  },
  appearance = { nerd_font_variant = "mono" },
  -- cmdline = { enabled = false },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
}
