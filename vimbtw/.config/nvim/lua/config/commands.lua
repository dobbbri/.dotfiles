vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "MiniFilesTitle", { link = "MiniFilesBorder" })
    vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { link = "MiniFilesBorder" })
    vim.api.nvim_set_hl(0, "MiniPickBorderText", { link = "MiniPickBorder" })
    vim.api.nvim_set_hl(0, "MiniPickPrompt", { link = "MiniPickBorder" })
  end,
})

vim.api.nvim_create_user_command("InstallMyServers", function()
  vim.cmd(
    "MasonInstall " ..
    "astro-language-server bash-language-server json-lsp lua-language-server prettier shfmt stylua tailwindcss-language-server typescript-language-server"
  )
end, {})

--  jump to the last place you’ve visited in a file before exiting
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "grug-far", "help", "lspinfo", "man", "notify", "qf", "query", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", 'q', "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
