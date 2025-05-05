local map = vim.keymap.set

-- general mappings
map("n", "1", "<cmd> w <CR>")
map("n", "2", "<cmd> q <CR>")
map("i", "jk", "<ESC>")

map("n", ";", ":", { desc = "Enter command mode" })
map("n", "<esc><esc>", "<cmd>noh<CR>", { desc = "Clear Highlights" })
map("n", "<c-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<c-a>", "<cmd>wa<CR>", { desc = "Save all file" })
map("n", "<c-t>", "<cmd>%y+<CR>", { desc = "Copy Whole File" })

-- files
map("n", "-", function() require("mini.files").open() end, { desc = "Show Fil[e] Manager" })
map("n", "<leader>e", function() require("mini.files").open() end, { desc = "Show Fil[e] Manager" })

-- fzf-lua
map("n", "<leader>f", "<cmd>FzfLua files<CR>", { desc = "List [f]iles" })
map("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { desc = "List open [b]uffers" })
map("n", "<leader>m", "<cmd>FzfLua resume<CR>", { desc = "List resu[m]e" })
map("n", "<leader>w", "<cmd>FzfLua live_grep<CR>", { desc = "Search by [w]ord" })
map("n", "<leader>S", "<cmd>FzfLua spell_suggest<cr>", { desc = "List [S]pelling Suggestions" })
map("n", "<leader>d", "<cmd>FzfLua diagnostics_document<cr>", { desc = "List [d]iagnostics" })
-- map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic LSP" })

-- oklch-color-picker
map(
  "n",
  "<leader>p",
  function() require("oklch-color-picker").pick_under_cursor() end,
  { desc = "Color [p]ick under cursor" }
)

-- move buffer
map("n", "<Tab>", "<cmd>bnext<CR>")
map("n", "<S-Tab>", "<cmd>bprevious<CR>")

-- remove buffer
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close current buffer" })
-- map("n", "<leader>", "<cmd>%bd|e#|bd#<cr>", { desc = "Close other buffers" })
map("n", "<leader>X", "<cmd>%bd<cr>", { desc = "Close all buffers" })

-- Toggle line number
-- map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle Line Number" })
-- map("n", "<leader>N", "<cmd>set rnu!<CR>", { desc = "Toggle Relative Number" })

-- code format
map("n", "f", "<cmd>Format<CR>", { desc = "[f]ormat File" })

-- search / replace
map("n", "<leader>s", ":%s///gcI<Left><Left><Left><Left><Left>", { desc = "[s]earch/Replace in current buffer" })
map({ "n", "v" }, "<leader>r", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Search and [r]eplace in project" })

--

-- global lsp mappings
-- map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic LSP" })
-- map("n", "d<leader>d", function()
--   if vim.diagnostic.config().virtual_lines then
--     vim.diagnostic.config({ virtual_lines = false })
--   else
--     vim.diagnostic.config({ virtual_lines = { current_line = true } })
--   end
-- end, { desc = "diagnostic Lsp" })

-- mappings -----------------------------------------------------------------------------------------
-- move line
-- map("n", "<S-j>", ":m .+1<CR>==") -- move line up(n)
-- map("n", "<S-k>", ":m .-2<CR>==") -- move line down(n)
-- map("v", "<S-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
-- map("v", "<S-k>", ":m '<-2<CR>gv=gv") -- move line down(v)

-- nvimtree
-- map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle fiel explorer" })
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
-- map("n", "<C-h>", "<cmd>NvimTreeFocus<CR>", { desc = "Focus on file explorer" })

-- open url
-- map("n", "<leader>u", "<cmd>URLOpenUnderCursor<CR>", { desc = "Open URL" })

-- git
-- map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff This" })
-- map("n", "<leader>gs", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Show hunk" })
-- map("n", "<leader>gh", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
-- map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
-- map("n", "<leader>gH", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
-- map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })

-- tinygit
-- map("n", "<leader>ga", function() require("tinygit").interactiveStaging() end, { desc = "Interactive Staging" })
-- map("n", "<leader>gC", function() require("tinygit").smartCommit() end, { desc = "Smart Commit" })
-- map("n", "<leader>gP", function() require("tinygit").push() end, { desc = "Push" })

-- terminal
-- map("n", "<leader>t", function() require("nvchad.term").toggle({ pos = "sp" }) end, { desc = "Toggle Terminal" })
-- map("t", "<ESC>", "<C-\\><C-N>:q<CR>", { desc = "escape terminal mode" })
