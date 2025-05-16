return {
  bold = true, -- makes primary parts bold
  style = "fg", -- or "bg"
  components = {
    left = {
      "mode",
      "path",
      "diagnostics",
    },
    center = {},
    right = {
      "filetype_lsp",
      "progress",
      "git",
    },
  },
  configs = {
    mode = {
      verbose = false, -- Mode as single letter or as a word
      hl = {
        normal = "Type",
        insert = "Function",
        pending = "Boolean",
        visual = "Keyword",
        command = "String",
      },
    },
    path = {
      directory = true, -- Whether to show the directory
      icons = {
        folder = "󰲂 ",
        modified = "●",
        read_only = "",
      },
    },
    git = {
      icons = {
        branch = "󰊢",
        added = "+",
        modified = "~",
        removed = "-",
      },
    },
    diagnostics = {
      workspace = false, -- Whether diagnostics should show workspace diagnostics instead of current buffer
      icons = {
        ERROR = vim.g.diagnostic_signs.error,
        WARN = vim.g.diagnostic_signs.warn,
        INFO = vim.g.diagnostic_signs.info,
        HINT = vim.g.diagnostic_signs.hint,
      },
    },
    filetype_lsp = {},
    progress = {
      follow = "mode",
      column = true, -- Enables a secondary section with the cursor column
      icon = " ",
    },
    recording = {
      icon = " ",
    },
  },
  spaces = {
    components = " ", -- string between components
    left = " ", -- string at the start of the line
    right = " ", -- string at the end of the line
  },
  sep = {
    hide = {
      first = false, -- hides the first separator of the line
      last = false, -- hides the last separator of the line
    },
    left = "", -- left separator of components
    right = "", -- right separator of components
  },
  hl = {
    base = "Comment", -- highlight of the background
    primary = "Normal", -- highlight of primary parts (e.g. filename)
    secondary = "Comment", -- highlight of secondary parts (e.g. filepath)
  },
}
