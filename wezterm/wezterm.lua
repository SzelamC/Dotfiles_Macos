local wezterm = require("wezterm")
local act = wezterm.action
local tab = require("tab")

local config = wezterm.config_builder()


-- font config
config.font = wezterm.font("ZedMono Nerd Font Mono")
config.font_size = 16
config.line_height = 1.2

-- chore config
config.window_decorations = "RESIZE"
config.front_end = "WebGpu"
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"

-- apperance config
config.window_padding = {
	top = "0.5cell",
	left = "2cell",
	right = "0.5cell",
}
config.window_background_opacity = 0.85
config.macos_window_background_blur = 45
config.hide_mouse_cursor_when_typing = true
config.color_scheme = "Poimandres"
config.disable_default_key_bindings = true

-- keymap config
config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	{ key = "q", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "-", mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "\\", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
	{ key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
	{ key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
	{ key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
	{ key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
	{ key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
	{ key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
	{ key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
	{ key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
}

tab.setup(config)
return config
