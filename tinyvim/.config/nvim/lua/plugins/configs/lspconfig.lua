local servers = {
  astro = {},
  tailwindcss = {},
  ts_ls = {
    -- default_config = {
    --   filetypes = {
    --     "javascript",
    --     "typescript",
    --   },
    -- },
  },
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        completion = { callSnippet = "Replace" },
        diagnostics = { globals = { "vim" } },
      },
    },
  },
  -- jsonls = {},
  -- volar = {},
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = {
--   textDocument = {
--     foldingRange = {
--       dynamicRegistration = false,
--       lineFoldingOnly = true
--     }
--   }
-- }

local lspconfig = require("lspconfig")
for server, config in pairs(servers) do
  config.capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
  -- config.capabilities = require("cmp_nvim_lsp").default_capabilities(config.capabilities)
  lspconfig[server].setup(config)
end

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})

local diagnostic_signs = {
  [vim.diagnostic.severity.ERROR] = "",
  [vim.diagnostic.severity.WARN] = "",
  [vim.diagnostic.severity.INFO] = "",
  [vim.diagnostic.severity.HINT] = "",
}

local shorter_source_names = {
  ["Lua Diagnostics."] = "Lua",
  ["Lua Syntax Check."] = "Lua",
}

local function diagnostic_format(diagnostic)
  return string.format(
    "%s %s (%s): %s",
    diagnostic_signs[diagnostic.severity],
    shorter_source_names[diagnostic.source] or diagnostic.source,
    diagnostic.code,
    diagnostic.message
  )
end

vim.diagnostic.config({
  virtual_text = true,
  -- virtual_lines = {
  --   current_line = true,
  --   format = diagnostic_format,
  -- },
  underline = true,
  severity_sort = true,
})
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
