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
-- config.window_frame = {
-- 	-- The overall background color of the tab bar when
-- 	-- the window is focused
-- 	-- active_titlebar_bg = "#1A1f29",
--
-- 	-- The overall background color of the tab bar when
-- 	-- the window is not focused
-- 	inactive_titlebar_bg = "#1a1b26",
-- }
config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#1F2430",
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#1A1F29",
			fg_color = "#CCCAC2",
		},
		inactive_tab = {
			bg_color = "#1F2430",
			fg_color = "#CCCAC2",
		},
	},
}

config.window_decorations = "RESIZE"
config.window_padding = {
	top = "0.5cell",
	left = "2cell",
	right = "0.5cell",
}

config.font = wezterm.font_with_fallback({
	{
		family = "Zed Mono",
		weight = "Regular",
		stretch = "Expanded",
		harfbuzz_features = { "calt=0", "dlig=0" },
	},
	"SF Pro",
})

config.font_size = 14
config.line_height = 1.4
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.hide_mouse_cursor_when_typing = true

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
