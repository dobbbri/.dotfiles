local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }

vim.diagnostic.config({
  virtual_lines = {
    spacing = 2,
    source = "if_many",
    prefix = "󰐊",
  },
  severity_sort = true,
  underline = {
    severity = vim.diagnostic.severity.ERROR,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
  },
})
