-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

-- @type ChadrcConfig
local M = {

  base46 = {
    theme = "catppuccin",
    transparency = false,
    hl_override = {
      Comment = { italic = true },
      ["@comment"] = { italic = true },
      NvimTreeCursorLine = { fg = "#ffffff", bold = true },
    },
  },

  ui = {
    cmp = {
      icons = true,
      lspkind_text = true,
      style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    statusline = { theme = "vscode" }, -- default/vscode/vscode_colored/minimal

    tabufline = {
      enabled = true,
      lazyload = true, -- lazyload it when there are 1+ buffers
      order = { "treeOffset", "buffers", "tabs", "btns" },
      modules = nil,
    },
  },

  term = {
    sizes = { sp = 0.5, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = { relative = "editor", row = 0.3, col = 0.25, width = 0.5, height = 0.4, border = "single" },
  },

  colorify = {
    enabled = true,
    mode = "bg", -- fg, bg, virtual
    virt_text = "󱓻 ",
    highlight = { hex = true, lspvars = true },
  },

  mason = {
    pkgs = {
      "lua-language-server",
      "typescript-language-server",
      "astro-language-server",
      "json-lsp",
      "tailwindcss-language-server",
      -- "vue-language-server",
      "eslint_d",
      "prettierd",
      "shfmt",
      "stylua",
    },
  },

  nvdash = {
    load_on_startup = false,
  },
}

return M
