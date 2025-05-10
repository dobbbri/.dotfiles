vim.diagnostic.config({
  virtual_lines = {
    spacing = 4,
    source = "if_many",
    prefix = "󰐊",
  },
  virtual_text = false,
  underline = {
    severity = vim.diagnostic.severity.ERROR,
  },
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰐊",
      [vim.diagnostic.severity.WARN] = "󰐊",
      [vim.diagnostic.severity.INFO] = "󰐊",
      [vim.diagnostic.severity.HINT] = "󰐊",
    },
  },
  float = {
    border = "rounded",
    source = "if_many",
    style = "minimal",
  },
})
