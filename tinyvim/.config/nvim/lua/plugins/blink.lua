return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "1.*",
  lazy = false,
  opts = {
    keymap = {
      preset = "none",
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
    completion = {
      keyword = { range = "full" },
      accept = { auto_brackets = { enabled = true } },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      menu = {
        auto_show = true,
        border = "none",
        draw = {
          components = {
            kind = {
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = true },
    },
    appearance = { nerd_font_variant = "mono" },
    -- cmdline = { enabled = false },
    sources = { default = { "lsp", "path", "snippets", "buffer", "omni", "omni" } },
    signature = { enabled = true },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
