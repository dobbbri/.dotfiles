vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup()

vim.api.nvim_create_user_command(
  "InstallThirdPartyTools",
  function()
    vim.cmd(
      "MasonInstall "
        .. "astro-language-server bash-language-server json-lsp biome prettier shfmt stylua taplo"
        .. " tailwindcss-language-server lua-language-server typescript-language-server yamlfmt"
    )
  end,
  {}
)
