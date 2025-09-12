vim.pack.add({ "https://github.com/mason-org/mason.nvim" }, { confirm = false })

require("mason").setup()

vim.lsp.enable({ 'astro', 'bashls', 'jsonls', 'lua_ls', 'tailwindcss', 'ts_ls' })
vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

vim.diagnostic.config({ virtual_text = true, severity_sort = true })

vim.keymap.set({ "n", "v" }, "f", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 3000 })<cr>", { desc = "Format File" })
vim.keymap.set("n", "<leader>D", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Go to diagnostics" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostic Info" })
