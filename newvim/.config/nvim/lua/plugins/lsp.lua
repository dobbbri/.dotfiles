vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

local servers = {
  astro = {},
  ts_ls = {},
  tailwindcs = {},
  lua_ls = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        completion = { callSnippet = "Replace" },
        diagnostics = { globals = { "vim" } },
      },
    },
  }
}

for srv, opts in pairs(servers) do
  if opts then vim.lsp.config(srv, opts) end
  vim.lsp.enable(srv)
end

vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

vim.diagnostic.config({ virtual_lines = true, severity_sort = true })

vim.keymap.set({ "n", "v" }, "f", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 3000 })<cr>", { desc = "Format File" })
vim.keymap.set("n", "<leader>D", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to diagnostics" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostic Info" })
