require("nvim-ts-autotag").setup({
  filetypes = { "html", "astro", "javascript", "typescript", "tsx", "jsx" },
  enable_check_bracket_line = false,
  autotag = {
    enable = true,
  },
})



  -- {
  --   "windwp/nvim-ts-autotag",
  --   event = "InsertEnter",
  --   config = function() require("plugins.configs.autotag") end,
  -- },

