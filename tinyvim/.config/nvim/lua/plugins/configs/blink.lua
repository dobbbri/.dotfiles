return {
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
  },
  enabled = function()
    return not vim.tbl_contains({ "lua", "markdown", "DressingInput" }, vim.bo.filetype)
      and vim.bo.buftype ~= "prompt"
      and vim.b.completion ~= false
  end,
  completion = {
    accept = { auto_brackets = { enabled = true } },
    -- list = {
    --   selection = {
    --     preselect = function(ctx) return ctx.mode ~= "cmdline" end,
    --     auto_insert = function(ctx) return ctx.mode ~= "cmdline" end,
    --   },
    -- },
    menu = {
      draw = {
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = { enabled = true },
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    cmdline = {},
  },
  -- sources = {
  --   default = { "lsp", "path", "snippets", "buffer", "markdown" },
  --   providers = {
  --     markdown = {
  --       name = "RenderMarkdown",
  --       module = "render-markdown.integ.blink",
  --       fallbacks = { "lsp" },
  --     },
  --   },
  -- },
  -- signature = { enabled = true },
}
