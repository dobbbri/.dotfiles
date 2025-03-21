local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent


-- files
map("n", "-", function() require("mini.files").open() end, {desc = "Open Files" })
map("n", "<leader>e", function() require("mini.files").open() end, {desc = "Open Files" })

-- nvimtree
-- map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle fiel explorer" })
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
-- map("n", "<C-h>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on file explorer" })

-- fzf-lua
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
map("n", "<leader><space>", "<cmd>FzfLua buffers<CR>", { desc = "List by opened files history" })
map("n", "<leader>fo", "<cmd>FzfLua oldfiles<CR>", { desc = "List by opened files history" })
map("n", "<leader>fw", "<cmd>FzfLua live_grep<CR>", { desc = "Find by word" })

-- bufferline, cycle buffers
-- map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
-- map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<Tab>", "<cmd> bnext <CR>")
map("n", "<S-Tab>", "<cmd> brevious <CR>")
map("n", "<leader>xx", "<cmd> bd <CR>", { desc = "Close current buffer" })
map("n", "<leader>xo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close other buffers" })
map("n", "<leader>xa", "<cmd>%bd<cr>", { desc = "Close all buffers" })

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true, desc = "Comment line" })
map("v", "<leader>/", "gc", { remap = true, desc = "Comment multiple lines" })

map("n", "<esc>", "<cmd>noh<CR>", { desc = "Clear Highlights" })

-- map("n", "<c-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<c-a>", "<cmd>%y+<CR>", { desc = "Copy Whole File" })

map("n", "<leader>ln", "<cmd>set nu!<CR>", { desc = "Toggle Line Number" })
map("n", "<leader>lr", "<cmd>set rnu!<CR>", { desc = "Toggle Relative Number" })

-- code format
map("n", "<leader>cf", "<cmd>Format<CR>", { desc = "Format File" })
map("n", "f", "<cmd>Format<CR>", { desc = "Format File" })

-- global lsp mappings
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic LSP" })

-- my mappings -----------------------------------------------------------------------------------------
-- move line
-- map("n", "<S-j>", ":m .+1<CR>==") -- move line up(n)
-- map("n", "<S-k>", ":m .-2<CR>==") -- move line down(n)
-- map("v", "<S-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
-- map("v", "<S-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- others
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>")

-- open url
map("n", "<leader>u", "<cmd>URLOpenUnderCursor<CR>", { desc = "Open URL" })

-- search / replace
map("n", "<leader>sb", ":%s///gcI<Left><Left><Left><Left><Left>", { desc = "Search/Replace in current buffer" })
map({ "n", "v" }, "<leader>sr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Search and Replace" })

-- git
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff This" })
map("n", "<leader>gs", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Show hunk" })
map("n", "<leader>gh", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>gH", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })

-- tinygit
map("n", "<leader>ga", function() require("tinygit").interactiveStaging() end, { desc = "Interactive Staging" })
map("n", "<leader>gc", function() require("tinygit").smartCommit() end, { desc = "Smart Commit" })
map("n", "<leader>gp", function() require("tinygit").push() end, { desc = "Push" })

-- terminal
-- map("n", "<leader>t", function() require("nvchad.term").toggle({ pos = "sp" }) end, { desc = "Toggle Terminal" })
-- map("t", "<ESC>", "<C-\\><C-N>:q<CR>", { desc = "escape terminal mode" })
