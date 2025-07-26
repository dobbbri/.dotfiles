return {
  "ibhagwan/fzf-lua",
  lazy = false,
  opts = {
    winopts = { split = "botright new" },
    grep = {
      rg_opts = "--column --hidden --line-number --no-heading --color=always --smart-case --max-columns=4096 --glob=!.git/ -e",
    },
  },
}
