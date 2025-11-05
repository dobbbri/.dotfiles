vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
}, { confirm = false })

require("blink.cmp").setup({
  keymap = { preset = "enter" },
  completion = {
    list = { selection = { preselect = false } },
    menu = { auto_show = true, border = "none" },
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    ghost_text = { enabled = true },
  },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  signature = { enabled = true },
  fuzzy = {
    implementation = "prefer_rust",
    prebuilt_binaries = { ignore_version_mismatch = true },
  },
})
