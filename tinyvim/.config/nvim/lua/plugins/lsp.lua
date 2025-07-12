vim.api.nvim_create_user_command("MasonAllLSPinstall", function()
  vim.cmd(
    "MasonInstall lua-language-server typescript-language-server astro-language-server tailwindcss-language-server prettier shfmt stylua xmlformatter clang-format"
    -- "eslint_d prettierd vue-language-server json-lsp"
  )
end, {})

vim.diagnostic.config({ virtual_text = false, severity_sort = true })

vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {},
}
