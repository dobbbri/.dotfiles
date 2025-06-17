return {
  "luukvbaal/statuscol.nvim",
  config = function()
    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { require("statuscol.builtin").lnumfunc }, colwidth = 2, click = "v:lua.ScLa" },
        { text = { "%s" }, colwidth = 1, click = "v:lua.ScSa" },
        { text = { require("statuscol.builtin").foldfunc, " " }, click = "v:lua.ScFa" },
      },
    })
  end,
}
