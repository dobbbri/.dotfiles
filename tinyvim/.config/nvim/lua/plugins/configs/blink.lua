return {
  keymap = { preset = "enter" },
  completion = {
    accept = {
      auto_brackets = { enabled = true },
    },
    menu = {
      draw = { treesitter = { "lsp" } },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    -- optionally disable cmdline completions
    -- cmdline = {},
  },
  -- experimental signature help support
  -- signature = { enabled = true },
}
