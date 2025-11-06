vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
}, { confirm = false })

require("mason").setup()
require('mason-tool-installer').setup({
  ensure_installed = {
    "astro-language-server",
    "bash-language-server",
    "json-lsp",
    "prettier",
    "shfmt",
    "stylua",
    "taplo",
    "biome",
    "tailwindcss-language-server",
    "lua-language-server",
    "typescript-language-server",
    "yamlfmt",
  },
  integrations = {
    ['mason-lspconfig'] = false ,
    ['mason-null-ls'] = false,
    ['mason-nvim-dap'] = false,
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MasonToolsStartingInstall",
  callback = function()
    vim.schedule(function() print("mason-tool-installer is starting") end)
  end,
})

vim.lsp.enable({ "astro", "bashls", "jsonls", "lua_ls", "tailwindcss", "ts_ls" })
vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

-- vim.diagnostic.config({
--     float = { border = 'rounded' },
--     signs = { text = { ERROR = ' ', WARN = ' ', INFO = ' ', HINT = '󰌵'} },
--     virtual_text = true,
--     severity_sort = true
-- })

vim.keymap.set("n", "<leader>D", "<cmd>lua vim.diagnostic.jump()<CR>", { desc = "Go to diagnostics" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostic Info" })
-- vim.keymap.set({ "n", "v" }, "f",         "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format File" })
-- • Mappings:
--   • |grn| in Normal mode maps to |vim.lsp.buf.rename()|
--   • |grr| in Normal mode maps to |vim.lsp.buf.references()|
--   • |gri| in Normal mode maps to |vim.lsp.buf.implementation()|
--   • |gO| in Normal mode maps to |vim.lsp.buf.document_symbol()|
--   • |gra| in Normal and Visual mode maps to |vim.lsp.buf.code_action()|
--   • |grt| in Normal mode maps to |vim.lsp.buf.type_definition()|
--   • CTRL-S in Insert and Select mode maps to |vim.lsp.buf.signature_help()|

-- vim.api.nvim_create_user_command(
--   "InstallThirdPartyTools",
--   function()
--     vim.cmd(
--       "MasonInstall "
--         .. "astro-language-server bash-language-server json-lsp prettier shfmt stylua taplo prettier"
--         .. "tailwindcss-language-server lua-language-server typescript-language-server yamlfmt"
--     )
--   end,
--   {}
-- )
