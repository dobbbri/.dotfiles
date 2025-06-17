-- opt.formatexpr = "v:lua.require'conform'.formatexpr()"

-- {
--   "stevearc/conform.nvim",
--   event = { "BufWritePre" },
--   config = function() require("plugins.configs.formatters") end,
-- },

require("conform").setup({
  default_format_opts = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
    lsp_format = "fallback", -- not recommended to change
  },
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
    -- vue = { "prettier" },
  },
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args) require("conform").format({ async = true, bufnr = args.buf }) end,
-- })
--

-- vim.api.nvim_create_user_command("Format", function(args)
--   local range = nil
--   if args.count ~= -1 then
--     local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
--     range = {
--       start = { args.line1, 0 },
--       ["end"] = { args.line2, end_line:len() },
--     }
--   end
--   require("conform").format({ async = true, lsp_format = "fallback", range = range })
-- end, { range = true })
