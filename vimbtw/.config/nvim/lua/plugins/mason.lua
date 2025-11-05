vim.pack.add({ "https://github.com/mason-org/mason.nvim" }, { confirm = false })

require("mason").setup()

vim.api.nvim_create_user_command(
  "InstallThirdPartyTools",
  function()
    vim.cmd(
      "MasonInstall "
        .. "astro-language-server bash-language-server json-lsp biome prettier shfmt stylua taplo biome"
        .. " tailwindcss-language-server lua-language-server typescript-language-server yamlfmt"
    )
  end,
  {}
)
