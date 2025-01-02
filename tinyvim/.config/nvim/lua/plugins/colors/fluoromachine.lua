require("fluoromachine").setup({
  theme = "fluoromachine", -- fluoromachine, retrowave, delta
  glow = false,
  colors = function(_, color)
    return {
      bg = "#160724",
      bgdark = color.darken("#160724", 20),
    }
  end,
  overrides = { -- fake glow without bg
    ["Type"] = { fg = "#ffcc00" },
    ["Structure"] = { fg = "#ffcc00" },
    ["@tag.delimiter"] = { fg = "#FC199A" },
    ["@function"] = { bold = true },
    ["@keyword"] = { bold = true },
    ["@constant"] = { bold = true },
    ["function"] = { bold = true },
    ["keyword"] = { bold = true },
    ["constant"] = { bold = true },
    ["comment"] = { italic = true },
  },
})
