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
    list = {
      selection = "auto_insert",
    },
    -- menu = {
    --   auto_show = function(ctx) return ctx.mode ~= "cmdline" end,
    -- },
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  signature = { enabled = true }, -- experimental signature help support
}
