vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
}, { confirm = false })

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    sh = { "shfmt" },
    lua = { "stylua" },
    -- cpp = { "clang-format" },
    toml = { "taplo" },
    yaml = { "yamlfmt" },
    yml = { "yamlfmt" },
    astro = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    scss = { "prettier" },
    markdown = { "prettier" },
    -- graphql = { "prettier" },
    -- xml = { "xmlformatter" },
    -- vue = { "prettier" },
    -- svelte = { "prettier" },
  },
  default_format_opts = {
    lsp_fallback = false,
    async = false,
    timeout_ms = 3000,
  },
})

vim.keymap.set({ "n", "v" }, "f", function() conform.format() end, { desc = "Format file" })
