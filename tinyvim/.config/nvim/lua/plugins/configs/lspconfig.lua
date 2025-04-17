local servers = {
  astro = {},
  tailwindcss = {},
  ts_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        completion = { callSnippet = "Replace" },
        diagnostics = { globals = { "vim" } },
      },
    },
  }, -- jsonls = {},  -- volar = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local lspconfig = require("lspconfig")
for server, config in pairs(servers) do
  config.capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
  -- config.capabilities = require("cmp_nvim_lsp").default_capabilities(config.capabilities)
  lspconfig[server].setup(config)
end

vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
   [vim.diagnostic.severity.ERROR] = "",
   [vim.diagnostic.severity.WARN] = "",
   [vim.diagnostic.severity.INFO] = "",
   [vim.diagnostic.severity.HINT] = "",
    },
  },
  virtual_text = {
    source = "if_many",
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
})
-- vim.diagnostic.config({
--   -- virtual_text = false,
--   -- virtual_lines = { current_line = false },
--   underline = true,
--   severity_sort = true,
-- })
--
-- local diagnostic_signs = {
--   [vim.diagnostic.severity.ERROR] = "",
--   [vim.diagnostic.severity.WARN] = "",
--   [vim.diagnostic.severity.INFO] = "",
--   [vim.diagnostic.severity.HINT] = "",
-- }

-- Use LspAttach autocommand to only map the following keys
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function()
--     local map = vim.keymap.set
--     map(
--       "n",
--       "gd",
--       "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>",
--       { desc = "Goto Definition" }
--     )
--     map(
--       "n",
--       "gr",
--       "<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<cr>",
--       { desc = "References" }
--     )
--     map(
--       "n",
--       "gI",
--       "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>",
--       { desc = "Goto Implementation" }
--     )
--     map(
--       "n",
--       "gy",
--       "<cmd>FzfLua lsp_typedefs jump_to_single_result=true ignore_current_line=true<cr>",
--       { desc = "Goto T[y]pe Definition" }
--     )
--   end,
-- })
