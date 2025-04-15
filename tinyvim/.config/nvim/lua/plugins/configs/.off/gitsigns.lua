local solid_bar = "│"
local dashed_bar = "┊"

return {
  signs = {
    add = { text = solid_bar },
    untracked = { text = solid_bar },
    change = { text = solid_bar },
    delete = { text = solid_bar },
    topdelete = { text = solid_bar },
    changedelete = { text = solid_bar },
  },
  signs_staged = {
    add = { text = dashed_bar },
    untracked = { text = dashed_bar },
    change = { text = dashed_bar },
    delete = { text = dashed_bar },
    topdelete = { text = dashed_bar },
    changedelete = { text = dashed_bar },
  },
  preview_config = { border = "rounded" },
}


  -- {
  --   "lewis6991/gitsigns.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   opts = require("plugins.configs.gitsigns"),
  -- },

