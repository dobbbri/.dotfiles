  -- {
  --   "fzdwx/bufline.nvim",
  --   event = "BufEnter",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   opts = require("plugins.configs.bufline"),
  -- },

return {
  separator = function() return { str = "" } end,
  modified = function(bufnr) return vim.fn.getbufvar(bufnr, "&modified") == 1 and " ●" or "" end,
}
