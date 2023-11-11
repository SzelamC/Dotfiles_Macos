-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
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
	initial_rows = 500,
	initial_cols = 500,
	adjust_window_size_when_changing_font_size = false,

	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	show_new_tab_button_in_tab_bar = false,
	color_scheme = "Rosé Pine (base16)",

	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = wezterm.font({ family = "Monaspace Radon", weight = "Regular" }),

		-- The size of the font in the tab bar.
		-- Default to 10. on Windows but 12.0 on other systems
		font_size = 14.0,

		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#1F2430",

		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#1a1b26",
	},
	colors = {
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
	},

	window_decorations = "RESIZE",
	window_padding = {
		top = "0.5cell",
		left = "2cell",
		right = "0.5cell",
	},

	font = wezterm.font_with_fallback({
		{
			-- family = "IosevkaTerm Nerd Font",
			family = "Monaspace Radon",
			-- family = "Monaspace Krypton",
			weight = "Regular",
			harfbuzz_features = {
				"calt=0",
				"dlig=0",
			},
		},
		"termicons",
	}),

	font_size = 16,
	line_height = 1.4,
	exit_behavior = "Close",
	window_close_confirmation = "NeverPrompt",
	window_background_opacity = 0.9,
	macos_window_background_blur = 0,

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

local x = true

return config
