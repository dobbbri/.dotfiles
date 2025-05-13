vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#50fa7b" })
    -- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#F1FA8C" })
    -- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF5555" })
    --
    vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { link = "GitSignsAdd" })
    vim.api.nvim_set_hl(0, "MiniDiffSignChange", { link = "GitSignsChange" })
    vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { link = "GitSignsDelete" })

    vim.api.nvim_set_hl(0, "MiniFilesTitle", { link = "MiniFilesBorder" })

    vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })
    vim.api.nvim_set_hl(0, "BufLineTitleNoSel", { link = "Comment" })
  end,
})

-- mason, write correct names only
vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd(
    "MasonInstall lua-language-server typescript-language-server astro-language-server tailwindcss-language-server prettier shfmt stylua "
    -- "eslint_d prettierd vue-language-server json-lsp"
  )
end, {})

-- vim.api.nvim_create_user_command("Lint", function() require("lint").try_lint() end, {})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

local function augroup(name) return vim.api.nvim_create_augroup(name, { clear = true }) end

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
  pattern = {
    "grug-far",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "checkhealth",},
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
