vim.pack.add({
  { src = "https://github.com/kevinhwang91/nvim-ufo" },
  { src = 'https://github.com/kevinhwang91/promise-async' },
  { src = 'https://github.com/luukvbaal/statuscol.nvim' }
})

local builtin = require("statuscol.builtin")
require("statuscol").setup({
  relculright = true,
  segments = {
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    { text = { "%s" },                  click = "v:lua.ScSa" },
    { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
  }
})

vim.o.foldcolumn = '1' -- is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup({
  provider_selector = function()
    return { 'treesitter', 'indent' }
  end
})
