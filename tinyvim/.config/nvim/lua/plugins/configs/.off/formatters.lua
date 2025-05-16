-- {
--   "stevearc/conform.nvim",
--   event = { "BufWritePre" },
--   config = function() require("plugins.configs.formatters") end,
-- },

require("conform").setup({
  default_format_opts = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
    lsp_format = "fallback", -- not recommended to change
  },
  formatters_by_ft = {
    sh = { "shfmt" },
    lua = { "stylua" },
    astro = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    scss = { "prettier" },
    -- vue = { "prettier" },
  },
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args) require("conform").format({ async = true, bufnr = args.buf }) end,
-- })
