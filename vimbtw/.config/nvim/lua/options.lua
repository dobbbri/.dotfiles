local g = vim.g
local opt = vim.opt

vim.filetype.add({ extension = { mdx = "markdown" } })

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
opt.winborder = 'single'

-- nice confirmation dialog
opt.confirm = true

-- options
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.swapfile = false
opt.undofile = false

opt.timeoutlen = 700
opt.updatetime = 250

opt.cursorline = true
opt.cursorlineopt = "both"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- folding - ufo
opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

--
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
opt.clipboard = "unnamedplus"

-- Numbers
opt.number = true
opt.numberwidth = 2

-- disable nvim intro
opt.shortmess = 'aoOTIcF'

opt.splitbelow = true
opt.splitright = true

opt.conceallevel = 2

-- statusline
opt.laststatus = 3
opt.cmdheight = 0
opt.statusline = "  %{v:lua.string.upper(v:lua.vim.api.nvim_get_mode().mode)}  %t %h%m%r%w %{v:lua.vim.diagnostic.status()}  %=%{&fenc==''?&enc:&fenc} %y  %p%%  %l:%c  "

-- title
opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a [nvim]'
