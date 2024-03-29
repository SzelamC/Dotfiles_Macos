-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- This table will hold the configuration.
local config = {}

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
	local pane = tab.active_pane

	local index = string.format("%d: ", tab.tab_index + 1)

	local process = string.gsub(pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

	return { {
		Text = " " .. index .. process .. " ",
	} }
end)

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	adjust_window_size_when_changing_font_size = false,
	-- This is where you actually apply your config choices

	-- For example, changing the color scheme:
	color_scheme = "tokyonight_night",
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	show_new_tab_button_in_tab_bar = false,

	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = wezterm.font({ family = "Dank Mono", weight = "Bold" }),

		-- The size of the font in the tab bar.
		-- Default to 10. on Windows but 12.0 on other systems
		font_size = 16.0,

		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#1a1b26",

		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#1a1b26",
	},
	colors = {
		cursor_bg = "#fff",
		cursor_fg = "#172140",
		tab_bar = {
			-- The color of the inactive tab bar edge/divider
			inactive_tab_edge = "#1a1b26",
			active_tab = {
				-- The color of the background area for the tab
				bg_color = "#545873",
				fg_color = " #fff",
			},
			inactive_tab = {
				bg_color = "#1a1b26",
				fg_color = "#9699a3",
			},
		},
	},

	window_decorations = "RESIZE",
	window_padding = {
		top = "0.5cell",
		left = "2cell",
		right = "0.5cell",
	},

	font = wezterm.font_with_fallback({
		{
			-- family = "ProggyVector",
			family = "Iosevka",
			weight = "Regular",
			harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
		},
		"termicons",
	}),

	font_size = 16,
	line_height = 1.5,
	exit_behavior = "Close",
	window_close_confirmation = "NeverPrompt",
	window_background_opacity = 0.95,
	macos_window_background_blur = 20,

	-- disable_default_key_bindings = true

	leader = { key = "a", mods = "CTRL" },
	keys = {
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
	},

	-- and finally, return the configuration to wezterm
}

return config
