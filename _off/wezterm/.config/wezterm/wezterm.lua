-- Streamlined WezTerm configuration - maintains all functionality
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- Keybindings
config.keys = {}
-- Pane management
for _, v in ipairs({
	{ "-", act.SplitPane({ direction = "Right", size = { Percent = 30 } }) },
	{ "=", act.SplitPane({ direction = "Down", size = { Percent = 30 } }) },
	{ "Enter", act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ "\\", act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ "w", act.CloseCurrentPane({ confirm = true }) },
	{ "LeftArrow", act.ActivatePaneDirection("Left") },
	{ "RightArrow", act.ActivatePaneDirection("Right") },
	{ "UpArrow", act.ActivatePaneDirection("Up") },
	{ "DownArrow", act.ActivatePaneDirection("Down") },
	{ "t", act.SpawnTab("CurrentPaneDomain") },
	{ "q", act.CloseCurrentTab({ confirm = true }) },
	{ "c", act.CopyTo("ClipboardAndPrimarySelection") },
	{ "v", act.PasteFrom("Clipboard") },
	{ "+", act.IncreaseFontSize },
	{ "-", act.DecreaseFontSize },
	{ "*", act.ResetFontSize },
}) do
	table.insert(config.keys, { mods = "ALT", key = v[1], action = v[2] })
end

-- Tab navigation (ALT+1-8)
for i = 0, 7 do
	table.insert(config.keys, { mods = "ALT", key = tostring(i + 1), action = act.ActivateTab(i) })
end

-- Tab movement and last tab (CTRL+ALT)
for _, v in ipairs({
	{ "UpArrow", act.ActivateLastTab },
	{ "DownArrow", act.ActivateLastTab },
	{ "LeftArrow", act.MoveTabRelative(-1) },
	{ "RightArrow", act.MoveTabRelative(1) },
}) do
	table.insert(config.keys, { mods = "CTRL|ALT", key = v[1], action = v[2] })
end
for i = 0, 7 do
	table.insert(config.keys, { mods = "CTRL|ALT", key = tostring(i + 1), action = act.MoveTab(i) })
end

-- Font configuration
config.font = wezterm.font_with_fallback({
	{ family = "SFMono Nerd Font", weight = "Regular" },
	{ family = "Symbols Nerd Font Mono", weight = "Regular" },
})
config.font_size = 14
config.line_height = 1.4
config.cell_width = 1.0
config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 0,
}

-- Performance settings
config.max_fps = 120
config.animation_fps = 1
config.window_background_opacity = 0.85
config.enable_scroll_bar = false
config.use_fancy_tab_bar = true
config.term = "xterm-256color"
config.warn_about_missing_glyphs = false
config.enable_wayland = false
-- config.front_end = "OpenGL"
-- config.webgpu_power_preference = "HighPerformance"
config.prefer_egl = true
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"

-- Color scheme
config.color_scheme = "gruvboxdarkhard"

-- Mouse bindings
config.mouse_bindings = {
	{ event = { Down = { streak = 1, button = "Right" } }, mods = "NONE", action = act.CopyTo("Clipboard") },
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "NONE",
		action = act.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		event = { Down = { streak = 1, button = "Middle" } },
		mods = "SHIFT",
		action = act.CloseCurrentPane({
			confirm = false,
		}),
	},
}

config.hide_tab_bar_if_only_one_tab = true

return config
