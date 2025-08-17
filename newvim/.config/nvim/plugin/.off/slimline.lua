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
      right = {
        "filetype_lsp",
        function()
          local h = require("slimline.highlights")
          return h.hl_component({ primary = " %l/%c" }, h.hls.components["path"], "")
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
        hl = { primary = "String" },
      },
      path = {
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
      recording = { icon = " " },
    },
    hl = {
      base = "Selection",
      primary = "Normal",
      secondary = "Comment",
    },
  },
}
