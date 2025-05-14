local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(capabilities),
})
