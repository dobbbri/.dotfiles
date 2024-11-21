-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/autocmds.lua
require("nvchad.autocmds")

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
