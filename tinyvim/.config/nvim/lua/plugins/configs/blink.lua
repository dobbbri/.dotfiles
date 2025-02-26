return {
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      window = { border = "rounded" },
    },
    ghost_text = { enabled = true },
    trigger = { show_on_keyword = true },
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  -- cmdline = { enabled = false },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
}
