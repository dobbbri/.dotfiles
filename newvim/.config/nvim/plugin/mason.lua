vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

require("mason").setup()

vim.api.nvim_create_user_command("MasonAllLSPinstall", function()
  vim.cmd(
    "MasonInstall " ..
    "lua-language-server typescript-language-server astro-language-server tailwindcss-language-server prettier"
  )
end, {})
