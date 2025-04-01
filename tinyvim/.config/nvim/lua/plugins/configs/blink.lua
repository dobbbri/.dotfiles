return {
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
  },
  completion = {
    keyword = { range = "full" },
    accept = { auto_brackets = { enabled = false } },
    list = { selection = { preselect = false, auto_insert = true } },
    menu = { auto_show = true, border = "none" },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },
  appearance = { nerd_font_variant = "mono" },
  -- cmdline = { enabled = false },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  signature = { enabled = true },
}
