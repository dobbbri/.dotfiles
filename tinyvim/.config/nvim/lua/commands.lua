-- mason, write correct names only
vim.api.nvim_create_user_command(
    "MasonInstallAll",
  function()
    vim.cmd(
      "MasonInstall lua-language-server typescript-language-server astro-language-server json-lsp tailwindcss-language-server eslint_d prettierd shfmt stylua "
    )
  end,
  -- "vue-language-server",
  {}
)

-- vim.api.nvim_create_user_command("Lint", function() require("lint").try_lint() end, {})

vim.api.nvim_create_user_command("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
