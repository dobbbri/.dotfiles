dofile(vim.g.base46_cache .. "whichkey")

local wk = require("which-key")
wk.add({
  { "<leader>f", group = "Find file" },
  { "<leader>c", group = "Code" },
  { "<leader>g", group = "Git" },
  { "<leader>t", icon = { icon = " ", color = "white" } },
  { "<leader>e", icon = { icon = "󱏒 ", color = "blue" } },
  { "<leader>s", group = "Search/Replace", icon = { icon = "󰛔 ", color = "green" } },
  { "<leader>q", group = "Quit" },
  { "<leader>w", group = "Save", icon = { icon = " ", color = "cyan" } },
  { "<leader>r", group = "Rename", icon = { icon = " ", color = "magenta" } },
  { "<leader>u", icon = { icon = "󰖟 ", color = "red" } },
  { "<leader>l", group = "Toggle Line Number" },
  { "[", group = "prev" },
  { "]", group = "next" },
  { "g", group = "goto" },
  { "gs", group = "surround" },
  { "z", group = "fold" },
  {
    "<leader>b",
    group = "Buffer",
    expand = function() return require("which-key.extras").expand.buf() end,
  },
  {
    "<leader>w",
    group = "Windows",
    proxy = "<c-w>",
    expand = function() return require("which-key.extras").expand.win() end,
  },
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>qq", "<cmd>qa<cr>", desc = "Quit All" },
    { "<leader>q", "<cmd>qq<cr>", desc = "Quit" },
    { "<leader>wa", "<cmd>wa<cr>", desc = "Save All" },
    { "<leader>ww", "<cmd>w<cr>", desc = "Save" },
  },
})
