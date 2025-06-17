return {
  "nvim-lualine/lualine.nvim",
  dependencies = "meuter/lualine-so-fancy.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        globalstatus = true,
        theme = vim.g.lualine_theme,
        section_separators = require("config").icons.separators.none,
        component_separators = require("config").icons.separators.none,
        refresh = { statusline = 100 },
      },
      sections = {
        lualine_a = { { "fancy_mode" } },
        lualine_b = { { "fancy_branch" }, { "fancy_diff" } },
        lualine_c = { { "fancy_cwd", substitute_home = true } },
        lualine_x = { { "fancy_diagnostics" } },
        lualine_y = { { "fancy_searchcount" }, { "fancy_location" } },
        lualine_z = {
          { "fancy_filetype", ts_icon = "󰛦" },
          { "fancy_lsp_servers" },
          { require("lazy.status").updates, cond = require("lazy.status").has_updates },
        },
      },
      tabline = {
        lualine_a = { { "buffers", use_mode_colors = true, symbols = { alternate_file = "" } } },
        lualine_z = { "fileformat" },
      },
      extensions = { "toggleterm", "lazy", "mason", "man" },
    })
  end,
}
