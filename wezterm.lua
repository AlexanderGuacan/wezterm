local wezterm = require("wezterm")

local config = wezterm.config_builder()

local function has_ubuntu_wsl()
	local success, stdout, _ = wezterm.run_child_process({
		"wsl",
		"-l",
		"-q",
	})

	if not success then
		return false
	end

	stdout = stdout:gsub("\0", "")
	
	return stdout:lower():find("ubuntu", 1, true) ~= nil
end

config.initial_cols = 120
config.initial_rows = 28
config.window_decorations = "RESIZE"
config.audible_bell = "Disabled"

config.font_size = 11
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
	"JetBrainsMonoNL Nerd Font Mono",
})

config.color_scheme = "Catppuccin Macchiato (Gogh)"

config.window_padding = {
	left = 2,
	right = 0,
	top = 4,
	bottom = 0,
}

if has_ubuntu_wsl() then
	config.default_prog = { "wsl", "-d", "Ubuntu", "--cd", "~" }
end

config.keys = {
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "h", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	{ key = "j", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	{ key = "k", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	{ key = "l", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
	{
		key = "|",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "_",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Cells = 20 },
		}),
	},
}

return config
