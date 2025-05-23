require("lint").linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  astro = { "eslint_d" },
  -- lua = { "luacheck" },
  -- vue = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function() require("lint").try_lint() end,
})

-- {
--   "mfussenegger/nvim-lint",
--   events = { "BufWritePost", "BufReadPost", "InsertLeave" },
--   config = function() require("plugins.configs.linters") end,
-- },

-- vim.api.nvim_create_user_command("Lint", function() require("lint").try_lint() end, {})
