return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = {
          "vim",
          "require",
        },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
      format = {
        defaultConfig = {
          indent_style = "space",
          max_line_length = "140",
          indent_size = "2",
          continuation_indent = "2",
          quote_style = "double",
          call_arg_parentheses = "always",
          space_before_closure_open_parenthesis = "false",
          align_continuous_similar_call_args = "true",
        },
      },
    },
  },
}
