local ft = require("guard.filetype")

ft("astro,typescript,javascript,javascriptreact,typescriptreact"):fmt("prettier")
ft("css,scss,html,yaml,json,jsonc,markdown"):fmt("prettier")
ft("lua"):fmt("stylua")
ft("sh"):fmt("shfmt")

vim.g.guard_config = {
  fmt_on_save = true,
  lsp_as_default_formatter = true,
}
