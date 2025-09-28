vim.pack.add({
  { src="https://github.com/nvim-treesitter/nvim-treesitter" , branch = 'master', build = ":TSUpdate"}
})

local utils = require("config.utils")

require("nvim-treesitter.configs").setup({
  modules = {}, -- You can specify modules here if needed
  sync_install = false, -- Set to true to install parsers synchronously
  ignore_install = {}, -- List of parsers to ignore during installation
  auto_install = true, -- Set to true to automatically install missing parsers
  ensure_installed = utils.parser_names(),
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
})

vim.api.nvim_create_autocmd("PackChanged", {
  desc = "Handle nvim-treesitter updates",
  group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
  callback = function(event)
    if event.data.kind == "update" and event.data.spec.name == "nvim-treesitter" then
      vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
      ---@diagnostic disable-next-line: param-type-mismatch
      local ok = pcall(vim.cmd, "TSUpdate")
      if ok then
        vim.notify("TSUpdate completed successfiully", vim.log.levels.INFO)
      else
        vim.notify("TSUpdate command not available yet, skipping...", vim.log.levels.WARN)
      end
    end
  end,
})
