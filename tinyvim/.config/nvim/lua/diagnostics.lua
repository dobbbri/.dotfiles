local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

vim.diagnostic.config({
  update_in_insert = false,
  virtual_lines = true,
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
  },
})
