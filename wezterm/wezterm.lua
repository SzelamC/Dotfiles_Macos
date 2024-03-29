-- Pull in the wezterm API
local wezterm = require("wezterm")
local theme = require("theme")
local tabs = require("tabs")
local act = wezterm.action

local config = {}
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.initial_rows = 500
config.initial_cols = 500
config.adjust_window_size_when_changing_font_size = false

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

config.window_decorations = "RESIZE"
config.window_padding = {
	top = "0.5cell",
	left = "2cell",
	right = "0.5cell",
}

config.font = wezterm.font_with_fallback({
	{
		family = "Zed Mono",
		harfbuzz_features = { "calt=0", "dlig=0" },
	},
	{
		family = "Iosevka Nerd Font Mono",
		harfbuzz_features = { "calt=0", "dlig=0" },
	},
	"termicons",
})

config.font_size = 15
config.line_height = 1.15
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 35

-- disable_default_key_bindings = true

config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	{ key = "w", mods = "ALT", action = act.SendString("\x1bf") },
	{ key = "b", mods = "ALT", action = act.SendString("\x1bb") },
	{
		key = "q",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = false }),
	},

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

theme.setup(config)
tabs.setup(config)

-- and finally, return the configuration to wezterm
return config
