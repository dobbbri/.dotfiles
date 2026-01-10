-- Minimal WezTerm configuration using iTerm2 color schemes
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- Use built-in iTerm2 color scheme (WezTerm ships with 700+ schemes)
-- Popular options: "Dracula", "Kanagawa (Gogh)", "Gruvbox Dark (Gogh)",
--                  "GruvboxDark", "nord", "Tokyo Night", "Catppuccin Mocha"
-- See full list: https://wezterm.org/colorschemes/

-- GitHub Dark color palette
local colors = {
	fg = "#d0d7de",
	bg = "#0d1117",
	comment = "#8b949e",
	red = "#ff7b72",
	green = "#3fb950",
	yellow = "#d29922",
	blue = "#539bf5",
	magenta = "#bc8cff",
	cyan = "#39c5cf",
	selection = "#415555",
	caret = "#58a6ff",
	invisibles = "#2f363d",
}

config.color_scheme = "Catppuccin Mocha"

-- Font (adjust to your preference)
-- Font configuration
config.font = wezterm.font_with_fallback({
	"Lilex",
	"Noto Color Emoji", -- emoji fallback (Linux)
	"Symbols Nerd Font", -- ensures all Nerd Font glyphs render
})

-- Make sure bold and italic variants are picked correctly
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font_with_fallback({
			{
				family = "Lilex",
				weight = "Bold",
			},
			"Symbols Nerd Font",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font_with_fallback({
			{
				family = "Lilex",
				style = "Italic",
				harfbuzz_features = { "zero", "ss01", "calt", "cv08", "ss02", "ss04", "ss05" },
			},
			"Symbols Nerd Font",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font_with_fallback({
			{
				family = "Lilex",
				weight = "Bold",
				style = "Italic",
				harfbuzz_features = { "zero", "ss01", "calt", "cv08", "ss02", "ss04", "ss05" },
			},
			"Symbols Nerd Font",
		}),
	},
}
config.font_size = 15 -- Lilex
config.line_height = 1.1
-- config.font_size = 17 -- UbuntuMono
-- config.font_size = 14 -- JetBrainsMono
-- config.line_height = 1.0
config.window_frame = {
	font = wezterm.font({
		family = "UbuntuMono Nerd Font",
		weight = "Regular",
		harfbuzz_features = { "zero", "ss01", "calt", "cv08", "ss02", "ss04", "ss05" },
	}),
	font_size = 12.0,
	active_titlebar_bg = colors.bg,
}

-- Performance
-- config.max_fps = 120
-- config.window_background_opacity = 1.0
-- config.front_end = "OpenGL"
config.window_background_opacity = 0.95
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.term = "xterm-256color"
config.warn_about_missing_glyphs = false

-- Keybindings - ALT-based for panes and tabs
config.keys = {}

-- Pane management
for _, v in ipairs({
	{ "Enter", act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ "w", act.CloseCurrentPane({ confirm = true }) },
	{ "LeftArrow", act.ActivatePaneDirection("Left") },
	{ "RightArrow", act.ActivatePaneDirection("Right") },
	{ "UpArrow", act.ActivatePaneDirection("Up") },
	{ "DownArrow", act.ActivatePaneDirection("Down") },
}) do
	table.insert(config.keys, { mods = "ALT", key = v[1], action = v[2] })
end

-- Vertical split
table.insert(
	config.keys,
	{ mods = "ALT|SHIFT", key = "Enter", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) }
)

-- Tab management
table.insert(config.keys, { mods = "ALT", key = "t", action = act.SpawnTab("CurrentPaneDomain") })
table.insert(config.keys, { mods = "ALT", key = "q", action = act.CloseCurrentTab({ confirm = true }) })

-- Tab navigation (ALT+1-8)
for i = 0, 7 do
	table.insert(config.keys, { mods = "ALT", key = tostring(i + 1), action = act.ActivateTab(i) })
end

-- Other
table.insert(config.keys, { mods = "ALT", key = "c", action = act.CopyTo("ClipboardAndPrimarySelection") })
table.insert(config.keys, { mods = "ALT", key = "v", action = act.PasteFrom("Clipboard") })
table.insert(config.keys, { mods = "ALT", key = "=", action = act.IncreaseFontSize })
table.insert(config.keys, { mods = "ALT", key = "-", action = act.DecreaseFontSize })
table.insert(config.keys, { mods = "ALT", key = "0", action = act.ResetFontSize })

-- Auto-detect Wayland
local is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil or os.getenv("XDG_SESSION_TYPE") == "wayland"
config.enable_wayland = is_wayland

-- Hide tab bar if only one tab
config.hide_tab_bar_if_only_one_tab = true

return config
