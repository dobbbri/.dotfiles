vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    sh = { "shfmt" },
    lua = { "stylua" },
    toml = { "taplo" },
    astro = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    -- xml = { "xmlformatter" },
    -- cpp = { "clang-format" },
    -- vue = { "prettier" },
  },
  default_format_opts = {
    lsp_fallback = true,
    async = true,
    timeout_ms = 3000,
  },
})

vim.keymap.set({ "n", "v" }, "f", function() conform.format() end, { desc = "Format file" })
