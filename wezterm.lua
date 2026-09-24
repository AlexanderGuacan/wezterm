local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Enable for WSL
-- config.default_prog = { "wsl", "-d", "Ubuntu", "--cd", "~" }
config.initial_cols = 120
config.initial_rows = 30
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 10.5
config.color_scheme = "GruvboxDarkHard"

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
	"JetBrainsMonoNL Nerd Font Mono",
})

config.window_padding = {
	left = 2,
	right = 0,
	top = 4,
	bottom = 0,
}

config.keys = {
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
		}),
	},
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 20 },
		}),
	},
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "h", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	{ key = "j", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	{ key = "k", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	{ key = "l", mods = "CTRL|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
}

return config
