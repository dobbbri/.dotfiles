local o = vim.opt
local g = vim.g

-- colorscheme
local colors = {
  { name = "fluoromachine", package = "maxmx03/fluoromachine.nvim" },
  { name = "gruvbox", package = "ellisonleao/gruvbox.nvim" },
  { name = "onedark", package = "navarasu/onedark.nvim" },
}
g.selected_color = colors[2]

-- mapleader
g.mapleader = " "
g.maplocalleader = ","

-- Fix markdown indentation settings
g.markdown_recommended_style = 2

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- use rounded borders on all floating windows
-- o.winborder = 'single' ---'rounded'

-- spell
o.spell = true
o.spelllang = 'en,pt'
-- COMANDOS
-- ]s - próxima palavra para correção
-- [s - palavra anterior para correção
-- z= - lista de sugestões
-- zg - adiciona a palavra do cursor na lista de sugestões
-- zug - desfaz o comando anterior
-- zw - remove a palavra do cursor da lista de sugestões
-- zuw - desfaz o comando anterior
--
-- options
o.swapfile = false
o.laststatus = 3
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorlineopt = "number"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

o.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
o.shortmess:append({ W = true, I = true, c = true, C = true })

o.signcolumn = "yes:1"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 700
o.undofile = false

o.wrap = false
o.linebreak = false
o.cmdheight = 0
o.encoding = "utf-8"
o.fileencoding = "utf-8"

-- folding
-- o.foldcolumn = '1' -- '0' is not bad
-- o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- o.foldlevelstart = 99
-- o.foldenable = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

o.formatexpr = "v:lua.require'conform'.formatexpr()"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
o.whichwrap:append("<>[]hl")

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

