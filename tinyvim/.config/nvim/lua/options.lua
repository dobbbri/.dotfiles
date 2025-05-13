local colorscheme = {
  { name = "fluoromachine", package = "maxmx03/fluoromachine.nvim" },
  { name = "gruvbox", package = "ellisonleao/gruvbox.nvim" },
  { name = "onedark", package = "navarasu/onedark.nvim" },
  { name = "dracula", package = "Mofiqul/dracula.nvim" },
  { name = "kanagawa", package = "rebelot/kanagawa.nvim" },
}
local opt = vim.opt
local g = vim.g

-- local random_colorscheme = math.random(1, 6)
g.selected_colorscheme = colorscheme[2]

-- mapleader
g.mapleader = " "
g.maplocalleader = ","

-- Fix markdown indentation settings
g.markdown_recommended_style = 2
g.markdown_fenced_languages = {"ts=typescript"}

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- use rounded borders on all floating windows
-- opt.winborder = 'solid' ---'rounded'

-- nice confirmation dialog
opt.confirm = true

-- options
opt.swapfile = false
opt.laststatus = 3
opt.showmode = false
opt.timeoutlen = 400
opt.ruler = true
opt.updatetime = 250
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorlineopt = "number"
opt.termguicolors = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 700
opt.undofile = false

opt.wrap = false
opt.linebreak = false
opt.cmdheight = 0
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- folding
-- opt.foldcolumn = '1' -- '0' is not bad
-- opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- opt.foldlevelstart = 99
-- opt.foldenable = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

opt.formatexpr = "v:lua.require'conform'.formatexpr()"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- opt.commentstring = '// %s'

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
