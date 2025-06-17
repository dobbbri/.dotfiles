local function augroup(name) return vim.api.nvim_create_augroup(name, { clear = true }) end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local set_default_hl = function(name, data)
      data.default = true
      vim.api.nvim_set_hl(0, name, data)
    end

    -- set_default_hl("StatusLine", { link = "Comment" })
    -- set_default_hl("MiniTablineFill", { link = "StatusLine" })
    -- set_default_hl("MiniTablineCurrent", { link = "Normal" })

    set_default_hl("MiniDiffSignAdd", { link = "GitSignsAdd" })
    set_default_hl("MiniDiffSignChange", { link = "GitSignsChange" })
    set_default_hl("MiniDiffSignDelete", { link = "GitSignsDelete" })

    set_default_hl("MiniFilesTitle", { link = "MiniFilesBorder" })

    -- set_default_hl("MiniStatuslineModeNormal", { link = "Comment" })
    -- set_default_hl("MiniStatuslineModeInsert", { link = "Normal" })
    -- set_default_hl("MiniStatuslineModeVisual", { link = "Normal" })
    -- set_default_hl("MiniStatuslineModeReplace", { link = "Normal" })
    -- set_default_hl("MiniStatuslineModeCommand", { link = "Normal" })
    -- set_default_hl("MiniStatuslineModeOther", { link = "Normal" })
  end,
})

-- mason, write correct names only
vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd(
    "MasonInstall lua-language-server typescript-language-server astro-language-server tailwindcss-language-server prettier shfmt stylua "
    -- "eslint_d prettierd vue-language-server json-lsp"
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
  group = augroup("close_with_q"),
  pattern = { "grug-far", "help", "lspinfo", "man", "notify", "qf", "query", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
