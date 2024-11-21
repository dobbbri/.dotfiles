--https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
-- require("nvchad.mappings")
-- add yours here

local map = vim.keymap.set

-- map("i", "<c-b>", "<esc>^i", { desc = "move beginning of line" })
-- map("i", "<c-e>", "<end>", { desc = "move end of line" })
-- map("i", "<c-h>", "<left>", { desc = "move left" })
-- map("i", "<c-l>", "<right>", { desc = "move right" })
-- map("i", "<c-j>", "<down>", { desc = "move down" })
-- map("i", "<c-k>", "<up>", { desc = "move up" })
--
-- map("n", "<c-h>", "<c-w>h", { desc = "switch window left" })
-- map("n", "<c-l>", "<c-w>l", { desc = "switch window right" })
-- map("n", "<c-j>", "<c-w>j", { desc = "switch window down" })
-- map("n", "<c-k>", "<c-w>k", { desc = "switch window up" })

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

-- tabufline
map("n", "<leader>b", "<CMD>enew<CR>", { desc = "New Buffer" })

map("n", "<tab>", function() require("nvchad.tabufline").next() end, { desc = "Goto Next Buffer" })
map("n", "<S-tab>", function() require("nvchad.tabufline").prev() end, { desc = "Goto Previous Buffer" })

map("n", "<leader>xx", function() require("nvchad.tabufline").close_buffer() end, { desc = "Close Buffer" })
map("n", "<leader>xa", function() require("nvchad.tabufline").closeAllBuffers() end, { desc = "Close All Buffer" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle Comment", remap = true })

-- telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fo", "<CMD>Telescope oldfiles<CR>", { desc = "Find Old Files" })
map("n", "<leader>fh", function() require("nvchad.themes").open() end, { desc = "Select Theme" })
-- map("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "telescope find buffers" })
-- map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "telescope help page" })

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
