return {
  "ibhagwan/fzf-lua",
  lazy = false,
  opts = {
    winopts = {
      split = "botright new",
      preview = {
        border = "none",
      },
    },
    grep = {
      rg_opts = "--column --hidden --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob=!.git/ -e",
    },
  },
  keys = {
    {
      "<Leader>zz",
      "<cmd>FzfLua<CR>",
    },
    {
      "<Leader>ff",
      function() require("fzf-lua").files({}) end,
    },
    {
      "<Leader>fg",
      function() require("fzf-lua").live_grep({}) end,
    },
    {
      "<Leader>fs",
      function() require("fzf-lua").git_status({}) end,
    },
    {
      "<Leader>fb",
      function() require("fzf-lua").buffers({}) end,
    },
    {
      "<Leader>fw",
      function() require("fzf-lua").grep_cword({}) end,
    },
    {
      "gr",
      function() require("fzf-lua").lsp_references({}) end,
    },
    {
      "gd",
      function() require("fzf-lua").lsp_definitions({}) end,
    },
    {
      "gD",
      function() require("fzf-lua").lsp_declarations({}) end,
    },
    {
      "gi",
      function() require("fzf-lua").lsp_implementations({}) end,
    },
  },
}
