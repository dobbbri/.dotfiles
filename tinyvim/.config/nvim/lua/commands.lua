vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local set_default_hl = function(name, data)
      data.default = true
      vim.api.nvim_set_hl(0, name, data)
    end
    set_default_hl("MiniFilesTitle", { link = "FloatBorder" })
  end,
})

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
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
