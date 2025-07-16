vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = false, timeout_ms = 3000, lsp_format = "fallback", range = range })
end, { range = true })

return {
  "stevearc/conform.nvim",
  -- event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        astro = { "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        scss = { "prettier" },
        xml = { "xmlformatter" },
        cpp = { "clang-format" },
        -- vue = { "prettier" },
      },
    })
  end,
}

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args) require("conform").format({ async = true, bufnr = args.buf }) end,
-- })
--
