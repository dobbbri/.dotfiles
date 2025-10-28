vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    sh = { "shfmt" },
    lua = { "stylua" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    toml = { "taplo" },
    yaml = { "yamlfmt" },
    yml = { "yamlfmt" },
    astro = { "biome" },
    javascript = { "biome", "biome-organize-imports" },
    javascriptreact = { "biome", "biome-organize-imports" },
    typescript = { "biome", "biome-organize-imports" },
    typescriptreact = { "biome", "biome-organize-imports" },
    css = { "biome", "biome-organize-imports" },
    html = { "biome", "biome-organize-imports" },
    json = { "biome", "biome-organize-imports" },
    jsonc = { "biome", "biome-organize-imports" },
    scss = { "prettier" },
    markdown = { "prettier" },
    -- graphql = { "biome" },
    -- xml = { "xmlformatter" },
    -- vue = { "biome" },
    -- svelte = { "biome" },
  },
  default_format_opts = {
    lsp_fallback = false,
    async = false,
    timeout_ms = 3000,
  },
})

vim.keymap.set({ "n", "v" }, "f", function() conform.format() end, { desc = "Format file" })
