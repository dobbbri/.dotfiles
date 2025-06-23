local ignore_files = {
  ".DS_Store",
  ".git",
  ".astro",
  ".vscode",
  ".gitignore",
  "dist",
  "lazy-lock.json",
  "package-lock.json",
  "node_modules",
  "pnpm-lock.yaml",
}

local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = "NW",
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end
require("mini.icons").setup()
require("mini.move").setup({ mappings = { left = "H", right = "L", down = "J", up = "K" } })
require("mini.pairs").setup({ modes = { insert = true, command = true, terminal = true } })
require("mini.pick").setup({ window = { config = win_config } })

local MiniFiles = require("mini.files")
MiniFiles.setup({
  use_as_default_explorer = false,
  permanent_delete = false,
  content = { filter = function(entry) return not vim.tbl_contains(ignore_files, entry.name) end },
  mappings = { close = "q", go_in_plus = "<CR>", go_out_plus = "<left>" },
})

local show_dotfiles = true
local filter_show = function() return true end
local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, ".") end

local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and filter_show or filter_hide
  MiniFiles.refresh({ content = { filter = new_filter } })
end

local files_set_cwd = function()
  local cur_entry_path = MiniFiles.get_fs_entry().path
  local cur_directory = vim.fs.dirname(cur_entry_path)
  if cur_directory ~= nil then
    vim.fn.chdir(cur_directory)
    MiniFiles.open()
    MiniFiles.reset()
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    vim.keymap.set("n", "<leader>.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle hidden files" })
    vim.keymap.set("n", "<leader>/", files_set_cwd, { buffer = args.data.buf_id, desc = "Set cwd" })
  end,
})
