-- vim.g.diagnostic_signs = { error = " ", warn = " ", hint = "󰌵 ", info = " " }
--
-- vim.diagnostic.config({
--   update_in_insert = false,
--   virtual_text = false,
--   -- virtual_lines = { current_line = true },
--   severity_sort = true,
--   underline = { severity = vim.diagnostic.severity.ERROR },
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = vim.g.diagnostic_signs.error,
--       [vim.diagnostic.severity.WARN] = vim.g.diagnostic_signs.warn,
--       [vim.diagnostic.severity.HINT] = vim.g.diagnostic_signs.hint,
--       [vim.diagnostic.severity.INFO] = vim.g.diagnostic_signs.info,
--     },
--   },
-- })
--
vim.diagnostic.config({
  underline = true,
  signs = {
    active = true,
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "󰟃",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  virtual_text = false,
  float = {
    border = "single",
    format = function(diagnostic)
      return string.format(
        "%s (%s) [%s]",
        diagnostic.message,
        diagnostic.source,
        diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
  },
})
