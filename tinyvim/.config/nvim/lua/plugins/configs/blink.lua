return {
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    -- ["<Tab>"] = { "snippet_forward", "fallback" },
    -- ["<S-Tab>"] = { "snippet_backward", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<Tab>"] = { "select_prev", "fallback" },
    ["<S-Tab>"] = { "select_next", "fallback" },
  },
  completion = {
    accept = { auto_brackets = { enabled = true } },
    list = {
      selection = {
        preselect = function(ctx) return ctx.mode ~= "cmdline" end,
        auto_insert = function(ctx) return ctx.mode ~= "cmdline" end,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
    },
    ghost_text = { enabled = true },
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "markdown" },
    providers = {
      markdown = {
        name = "RenderMarkdown",
        module = "render-markdown.integ.blink",
        fallbacks = { "lsp" },
      },
    },
  },
  signature = { enabled = true },
}
