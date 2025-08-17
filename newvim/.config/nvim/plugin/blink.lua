vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp" },
  -- { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("blink.cmp").setup({
  keymap = {
    preset = "none",
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
  },
  completion = {
    -- keyword = { range = "full" },
    -- accept = { auto_brackets = { enabled = true } },
    list = { selection = { preselect = false, auto_insert = true } },
    menu = { auto_show = true, border = "none" },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },
  -- snippets = { preset = "luasnip" },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  signature = { enabled = true },
  fuzzy = {
    implementation = 'lua',
    prebuilt_binaries = { ignore_version_mismatch = true },
  }
})
