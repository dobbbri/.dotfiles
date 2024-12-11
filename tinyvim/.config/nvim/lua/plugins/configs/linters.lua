require("lint").linters_by_ft = {
  lua = { "luacheck" },
  javascript = { "eslint" },
  typescript = { "eslint" },
  javascriptreact = { "eslint" },
  typescriptreact = { "eslint" },
  astro = { "eslint" },
  -- vue = { "eslint" },
}

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function() require("lint").try_lint() end,
})
