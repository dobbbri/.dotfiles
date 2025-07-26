return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = false,
      is_hidden_file = function(name) return name == ".." end,
    },
    keymaps = {
      ["ff"] = function()
        local oil = require("oil")
        require("fzf-lua").files({ cwd = oil.get_current_dir() })
      end,
      ["fg"] = function()
        local oil = require("oil")
        require("fzf-lua").live_grep({ cwd = oil.get_current_dir() })
      end,
    },
  },
  keys = {
    {
      "-",
      function() require("oil").open() end,
    },
  },
}
