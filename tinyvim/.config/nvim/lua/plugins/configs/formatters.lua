return {
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

  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}
