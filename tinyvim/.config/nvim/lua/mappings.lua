local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<leader>x", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

map("n", "<esc>", "<CMD>noh<CR>", { desc = "Clear Highlights" })

-- map("n", "<c-s>", "<CMD>w<CR>", { desc = "general save file" })
map("n", "<c-a>", "<CMD>%y+<CR>", { desc = "Copy Whole File" })

map("n", "<leader>ln", "<CMD>set nu!<CR>", { desc = "Toggle Line Number" })
map("n", "<leader>lr", "<CMD>set rnu!<CR>", { desc = "Toggle Relative Number" })
-- map("n", "<leader>ch", "<CMD>NvCheatsheet<CR>", { desc = "toggle nvcheatsheet" })

-- code format
map("n", "<leader>cf", function() require("conform").format({ lsp_fallback = true }) end, { desc = "Format File" })

-- global lsp mappings
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic LSP" })

-- my mappings -----------------------------------------------------------------------------------------

map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>")

-- Move current line up/down
map("n", "<S-k>", "<CMD>lua require('moveline').up<CR>")
map("n", "<S-j>", "<CMD>lua require('moveline').down<CR>")
map("v", "<S-k>", "<CMD>lua require('moveline').block_up<CR>")
map("v", "<S-j>", "<CMD>lua require('moveline').block_down<CR>")

-- open url
map("n", "<leader>u", "<CMD>URLOpenUnderCursor<CR>", { desc = "Open URL" })

-- search
map("n", "<leader>sb", ":%s///gcI<Left><Left><Left><Left><Left>", { desc = "Search/Replace in current buffer" })
map("n", "<leader>so", "<CMD>lua require('spectre').show_options()<CR>", { desc = "Show Spectre options" })
map("n", "<leader>ss", "<CMD>lua require('spectre').toggle()<CR>", { desc = "Toggle Spectre" })
map("n", "<leader>sr", "<CMD>lua require('spectre.actions').run_replace()<CR>", { desc = "Replace All results" })
map("n", "<leader>si", "<CMD>lua require('spectre').toggle_line()<CR>", { desc = "Replace Toggle item" })

-- git
map("n", "<leader>gd", "<CMD>Gitsigns diffthis<CR>", { desc = "Diff This" })
map("n", "<leader>gs", "<CMD>Gitsigns preview_hunk<CR>", { desc = "Show hunk" })
map("n", "<leader>gh", "<CMD>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>gH", "<CMD>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
map("n", "<leader>gR", "<CMD>Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })

-- tinygit
map("n", "<leader>gc", function() require("tinygit").smartCommit() end, { desc = "Smart Commit" })
map("n", "<leader>gp", function() require("tinygit").push() end, { desc = "Push" })

-- nvimtree
map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle Explorer" })

-- terminal
map("n", "<leader>t", function() require("nvchad.term").toggle({ pos = "sp" }) end, { desc = "Toggle Terminal" })
map("t", "<ESC>", "<C-\\><C-N>:q<CR>", { desc = "escape terminal mode" })
