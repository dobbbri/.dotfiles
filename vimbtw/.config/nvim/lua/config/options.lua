local g = vim.g
local opt = vim.opt

-- mapleader
g.mapleader = " "
g.maplocalleader = ","
--------------------------------------------------------------------------------------------------------------------

-- Fix markdown indentation settings
g.markdown_recommended_style = 2
g.markdown_fenced_languages = { "ts=typescript" }

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- use rounded borders on all floating windows
opt.winborder = "rounded"

-- nice confirmation dialog
opt.confirm = true

-- options
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.swapfile = false
opt.undofile = false

opt.timeoutlen = 700
opt.updatetime = 250

opt.cursorline = false
opt.cursorlineopt = "both"

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- folding - ufo
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

--
opt.list = false
opt.listchars = "nbsp:⍽,trail:·,extends:→,precedes:←"

opt.fillchars = {
  foldopen = "", -- "",
  foldclose = "", --"",-- "",
  foldsep = "│",
}

-- linebreak
opt.wrap = false
opt.breakindent = true
opt.whichwrap = "h,l,<,>,[,],~"
opt.showbreak = "󱞪 "

opt.ignorecase = true
opt.smartcase = true

opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Numbers
opt.number = true
opt.numberwidth = 2

-- disable nvim intro
opt.shortmess = "aoOTIcF"

opt.splitbelow = true
opt.splitright = true

opt.conceallevel = 2

-- title
opt.title = true
opt.titlestring = '%t%( %M%)%( (%{expand("%:~:h")})%)%a [nvim]'

vim.api.nvim_set_hl(0, "sttBold", { bold = true })
vim.api.nvim_set_hl(0, "sttNormal", { bold = false })
-- vim.api.nvim_set_hl(0, "SttDiag", { fg = "#ffffff" })

-- statusline
opt.laststatus = 3
-- opt.cmdheight = 0
opt.statusline =
  "%#SttBold# %{v:lua.string.upper(v:lua.vim.api.nvim_get_mode().mode)}  %{get(b:, 'branch_name', '')}  %t%#sttNormal# %h%m%r%w ln:%l, col:%c  %#SttBold# %{v:lua.vim.diagnostic.status()} %#sttNormal# %=%{&fenc==''?&enc:&fenc} %y  %p%% "

function MyTabline()
    local s = ''
    local tab_count = vim.fn.tabpagenr('$')

    for i = 1, tab_count do
        if i == vim.fn.tabpagenr() then
            s = s .. '%#TabLineSel#'
        else
            s = s .. '%#TabLine#'
        end

        s = s .. '%' .. i .. 'T' .. i .. ' ' .. vim.fn.fnamemodify(vim.fn.bufname(vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]), ':t')

        if i ~= tab_count then
            s = s .. '%#TabLineFill# | '
        end
    end

    return s
end

vim.o.tabline = '%!v:lua.MyTabline()'

