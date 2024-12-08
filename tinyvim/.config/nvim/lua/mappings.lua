local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent

-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle fiel explorer" })
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle file explorer" })
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>", { desc = "Focus on file explorer" })

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Lists previously open files" })
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Find by word" })
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "List git status" })

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<leader>xx", "<cmd> bd <CR>", { desc = "Close current buffer" })
map("n", "<leader>xo", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all but the current buffer" })

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true, desc = "Comment line" })
map("v", "<leader>/", "gc", { remap = true, desc = "Comment multiple lines" })

map("n", "<esc>", "<cmd>noh<CR>", { desc = "Clear Highlights" })

-- map("n", "<c-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<c-a>", "<cmd>%y+<CR>", { desc = "Copy Whole File" })

map("n", "<leader>ln", "<cmd>set nu!<CR>", { desc = "Toggle Line Number" })
map("n", "<leader>lr", "<cmd>set rnu!<CR>", { desc = "Toggle Relative Number" })

-- code format
map("n", "<leader>cf", function() require("conform").format({ lsp_fallback = true }) end, { desc = "Format File" })

-- global lsp mappings
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic LSP" })

-- my mappings -----------------------------------------------------------------------------------------
-- move line
map("n", "<S-j>", ":m .+1<CR>==") -- move line up(n)
map("n", "<S-k>", ":m .-2<CR>==") -- move line down(n)
map("v", "<S-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<S-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- others
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>")

-- open url
map("n", "<leader>u", "<cmd>URLOpenUnderCursor<CR>", { desc = "Open URL" })

-- search
map("n", "<leader>sb", ":%s///gcI<Left><Left><Left><Left><Left>", { desc = "Search/Replace in current buffer" })
map("n", "<leader>so", "<cmd>lua require('spectre').show_options()<CR>", { desc = "Show Spectre options" })
map("n", "<leader>ss", "<cmd>lua require('spectre').toggle()<CR>", { desc = "Toggle Spectre" })
map("n", "<leader>sr", "<cmd>lua require('spectre.actions').run_replace()<CR>", { desc = "Replace All results" })
map("n", "<leader>si", "<cmd>lua require('spectre').toggle_line()<CR>", { desc = "Replace Toggle item" })

-- git
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff This" })
map("n", "<leader>gs", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Show hunk" })
map("n", "<leader>gh", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>gH", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })

-- tinygit
map("n", "<leader>gc", function() require("tinygit").smartCommit() end, { desc = "Smart Commit" })
map("n", "<leader>gp", function() require("tinygit").push() end, { desc = "Push" })

-- terminal
-- map("n", "<leader>t", function() require("nvchad.term").toggle({ pos = "sp" }) end, { desc = "Toggle Terminal" })
-- map("t", "<ESC>", "<C-\\><C-N>:q<CR>", { desc = "escape terminal mode" })
