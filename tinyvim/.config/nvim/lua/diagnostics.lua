vim.diagnostic.config({
  update_in_insert = false,
  virtual_lines = { current_line = true },
  severity_sort = true,
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = vim.g.diagnostic_signs.error,
      [vim.diagnostic.severity.WARN] = vim.g.diagnostic_signs.warn,
      [vim.diagnostic.severity.HINT] = vim.g.diagnostic_signs.hint,
      [vim.diagnostic.severity.INFO] = vim.g.diagnostic_signs.info,
    },
  },
})
