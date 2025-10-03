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
    astro = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    yaml = { "yamlfmt" },
    yml = { "yamlfmt" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },
    -- xml = { "xmlformatter" },
    -- vue = { "prettier" },
  },
  default_format_opts = {
    lsp_fallback = false,
    async = false,
    timeout_ms = 3000,
  },
})

vim.keymap.set({ "n", "v" }, "f", function() conform.format() end, { desc = "Format file" })
