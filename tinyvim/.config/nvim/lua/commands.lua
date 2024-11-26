-- mason, write correct names only
vim.api.nvim_create_user_command(
  "MasonInstallAll",
  function()
    vim.cmd("MasonInstall lua-language-server typescript-language-server astro-language-server json-lsp tailwindcss-language-server eslint_d prettierd shfmt stylua ")
  end,
  -- "vue-language-server",
  {}
)

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if
      line > 1
      and line <= vim.fn.line("$")
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd('normal! g`"')
    end
  end,
})
