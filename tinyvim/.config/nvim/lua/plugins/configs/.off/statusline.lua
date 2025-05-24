local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function filepath()
  if vim.bo.filetype == "minifiles" then return "" end
  local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
  if fpath == "" or fpath == "." then return " " end

  return string.format("  %%<%s/", fpath) .. "%#StatusLine#"
end

local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then return "" end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError#" .. vim.g.diagnostic_signs.error .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning#" .. vim.g.diagnostic_signs.warn .. count["warnings"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation#" .. vim.g.diagnostic_signs.info .. count["info"]
  end
  if count["hints"] ~= 0 then hints = " %#LspDiagnosticsSignHint#" .. vim.g.diagnostic_signs.hint .. count["hints"] end

  return errors .. warnings .. info .. hints .. "%#StatusLine#"
end

local function filetype() return string.format(" %s ", vim.bo.filetype) .. "%#StatusLine#" end

local function lineinfo()
  if vim.bo.filetype == "alpha" then return "" end
  return " %P   %l:%c "
end

local vcs = function(data)
  local git_info = vim.b[data.buf].minidiff_summary
  if not git_info or git_info.head == "" then return "" end
  local added = git_info.add and ("%#GitSignsAdd#+" .. git_info.add .. " ") or ""
  local changed = git_info.change and ("%#GitSignsChange#~" .. git_info.change .. " ") or ""
  local removed = git_info.delete and ("%#GitSignsDelete#-" .. git_info.delete .. " ") or ""
  if git_info.add == 0 then added = "" end
  if git_info.change == 0 then changed = "" end
  if git_info.delete == 0 then removed = "" end
  return table.concat({
    " ",
    added,
    changed,
    removed,
    " ",
    "%#GitSignsAdd# ",
    git_info.head,
    " % ",
  })
end

Statusline = {}

Statusline.active = function()
  return table.concat({
    mode(),
    " % ",
    vcs(),
    " % ",
    filename(),
    " %#Comment# ",
    filepath(),
    " %=% ",
    lsp(),
    " %#Comment# ",
    filetype(),
    " % ",
    lineinfo(),
  })
end

function Statusline.inactive() return " %F" end

local au_opts = { pattern = "MiniDiffUpdated", callback = vcs }
vim.api.nvim_create_autocmd("User", au_opts)

vim.api.nvim_exec(
  [[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]],
  false
)
