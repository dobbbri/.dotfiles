return {
  keymap = { preset = "enter" },
  completion = {
    accept = {
      auto_brackets = { enabled = true },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    cmdline = {}, -- optionally disable cmdline completions
  },
  signature = { enabled = true }, -- experimental signature help support
}
