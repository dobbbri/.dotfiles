return {
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide" },
    ["<CR>"] = { "accept", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },
  completion = {
    accept = { auto_brackets = { enabled = true } },
    list = { selection = "manual" },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 100,
    },
    ghost_text = { enabled = true },
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  -- sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  sources = {
    default = function()
      local success, node = pcall(vim.treesitter.get_node)
      if vim.bo.filetype == "lua" then
        return { "lsp", "path" }
      elseif success and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
        return { "buffer" }
      else
        return { "lsp", "path", "snippets", "buffer" }
      end
    end,
  },
  signature = { enabled = true },
}
