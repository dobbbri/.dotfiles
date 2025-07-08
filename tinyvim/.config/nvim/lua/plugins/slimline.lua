return {
  "sschleemilch/slimline.nvim",
  opts = {
    bold = true, -- makes primary parts bold
    style = "fg", -- or "bg"
    components = {
      left = {
        "mode",
        "git",
        "path",
        "diagnostics",
      },
      -- center = {},
      right = {
        "filetype_lsp",
        function()
          local h = require("slimline.highlights")
          return h.hl_component({ primary = "  %l/%c " }, h.hls.components["path"], "")
        end,
      },
    },
    configs = {
      mode = {
        verbose = false, -- Mode as single letter or as a word
        hl = {
          normal = "Comment",
          insert = "Normal",
          pending = "Normal",
          visual = "Normal",
          command = "Normal",
        },
      },
      git = {
        icons = { branch = "󰊢", added = "+", modified = "~", removed = "-" },
        hl = { primary = "String" },
      },
      path = {
        directory = false, -- Whether to show the directory
        icons = { folder = "󰲂 ", modified = "●", read_only = "" },
        hl = { primary = "Label" },
      },
      diagnostics = {
        workspace = false, -- Whether diagnostics should show workspace diagnostics instead of current buffer
        icons = { ERROR = "E", WARN = "W", INFO = "I", HINT = "H" },
        hl = { primary = "Label" },
      },
      filetype_lsp = {
        hl = { primary = "String" },
      },
      -- progress = {
      --   column = true, -- Enables a secondary section with the cursor column
      --   icon = " ",
      -- },
      recording = { icon = " " },
    },
    spaces = { components = " ", left = " ", right = " " },
    sep = {
      hide = { first = false, last = false },
      left = "",
      right = "",
    },
    hl = {
      base = "Selection",
      primary = "Normal",
      secondary = "Comment",
    },
  },
}
