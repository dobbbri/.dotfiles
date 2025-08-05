return {
  "saghen/blink.cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", keys = {} },
    "rafamadriz/friendly-snippets"
  },
  version = "1.*",
  lazy = false,
  config = function()
    require("blink.cmp").setup({
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
        list = { selection = { preselect = false, auto_insert = true } },
        menu = { auto_show = true, border = "none" },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        ghost_text = { enabled = true },
      },
      snippets = { preset = "luasnip" },
      sources = { default = { "lsp", "path", "snippets", "buffer", "omni" } },
      signature = { enabled = true },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    })
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
  opts_extend = { "sources.default" },
}
