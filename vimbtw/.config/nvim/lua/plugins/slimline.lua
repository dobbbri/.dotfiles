vim.pack.add({
  "https://github.com/sschleemilch/slimline.nvim",
}, { confirm = false })

require("slimline").setup({
  style = "bg",
  bold = false,
  configs = {
    git = {
      hl = { primary = "Function" },
    },
    path = {
      hl = { primary = "Label" },
    },
    diagnostics = {
      icons = { ERROR = " ", WARN = "󰀨 ", INFO = " ", HINT = "󰠠 " },
    },
    filetype_lsp = {
      hl = { primary = "String" },
    },
  },
  components = {
    right = {
      "diagnostics",
      "filetype_lsp",
      function(active)
        local s = require("slimline")
        return s.highlights.hl_component({ primary = "  %l:%c  %p%% " }, s.highlights.hls.components["path"], s.get_sep("path"), "right", active, "fg")
      end,
    },
  },
})

-- vim.cmd("highlight Slimline guibg=#000000")
