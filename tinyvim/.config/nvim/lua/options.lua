local g = vim.g
local opt = vim.opt

-- mapleader
g.mapleader = " "
g.maplocalleader = ","

-- Fix markdown indentation settings
g.markdown_recommended_style = 2
g.markdown_fenced_languages = { "ts=typescript" }

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- use rounded borders on all floating windows
opt.winborder = "single" ---'rounded'

-- nice confirmation dialog
opt.confirm = true

-- options
opt.swapfile = false
opt.laststatus = 3
opt.showmode = false
opt.timeoutlen = 400
opt.updatetime = 250
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorlineopt = "number"
-- opt.termguicolors = true

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

opt.list = false
opt.listchars = 'nbsp:⍽,trail:·,extends:→,precedes:←'
opt.breakindent = true
opt.linebreak = true
opt.whichwrap = 'h,l,<,>,[,],~'
opt.showbreak = '󱞪 '

opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess = 'aoOTIcF'

-- opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 700
opt.undofile = false

-- opt.wrap = false
opt.cmdheight = 0
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Nice and simple folding:
-- zC Close
-- zO Open
opt.foldenable = true
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

opt.guicursor = {
  "n-v-c-sm:block-Cursor", -- Use 'Cursor' highlight for normal, visual, and command modes
  "i-ci-ve:ver25-lCursor", -- Use 'lCursor' highlight for insert and visual-exclusive modes
  "r-cr:hor20-CursorIM", -- Use 'CursorIM' for replace mode
}

opt.statusline = " %f%=%l/%c "

-- enable netrw_plugin in init.vim
-- g.netrw_keepdir = 0
-- g.netrw_winsize = 30
-- g.netrw_banner = 0
-- g.netrw_localcopydircmd = 'cp -r'

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH
