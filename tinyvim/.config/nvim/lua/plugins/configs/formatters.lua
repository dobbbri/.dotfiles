require("conform").setup({
  formatters_by_ft = {
    sh = { "shfmt" },
    lua = { "stylua" },
    astro = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    scss = { "prettierd" },
    -- vue = { "prettierd" },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args) require("conform").format({ async = true, bufnr = args.buf }) end,
})
