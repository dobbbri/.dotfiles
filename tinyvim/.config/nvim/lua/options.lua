local opt = vim.opt
local g = vim.g

-- colorscheme
local _colors = {
  { name = "fluoromachine", package = "maxmx03/fluoromachine.nvim" },
  { name = "gruvbox", package = "ellisonleao/gruvbox.nvim" },
  { name = "nordic", package = "alexvzyl/nordic.nvim" },
}
g._color = _colors[2]

-- mapleader
g.mapleader = " "
g.maplocalleader = ','

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- options
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cmdheight = 0
opt.confirm = true
opt.conceallevel = 2
opt.cursorline = true
opt.cursorlineopt = "number"
opt.encoding = "utf-8"
opt.expandtab = true
opt.fileencoding = "utf-8"
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
-- opt.jumpoptions = "view"
opt.laststatus = 3
opt.linebreak = false
opt.mouse = "a"
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 4
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.spelllang = { "en" }
opt.tabstop = 2
opt.termguicolors = true
-- opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = false
opt.swapfile = false
opt.cmdheight = 0
opt.softtabstop = 2
opt.numberwidth = 2
opt.ruler = false
opt.shortmess:append("sI")
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

