vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.cmd("set completeopt+=noselect")

vim.lsp.enable({ "astro", "ts_ls", "tailwindcss", "lua_ls" })
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      completion = { callSnippet = "Replace" },
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.diagnostic.config({ virtual_text = true, severity_sort = true })

vim.keymap.set({ "n", "v" }, "f", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 3000 })<cr>", { desc = "Format File" })
vim.keymap.set("n", "<leader>D", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to diagnostics" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostic Info" })
