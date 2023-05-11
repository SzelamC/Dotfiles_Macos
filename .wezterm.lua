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

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "tokyonight_night"
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),

  -- The size of the font in the tab bar.
  -- Default to 10. on Windows but 12.0 on other systems
  font_size = 13.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = "#1a1b26",

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = "#1a1b26",
}

config.colors = {
  cursor_bg = "#42f5e3",
  cursor_fg = "#112A46",
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = "#1a1b26",
    active_tab = {
      -- The color of the background area for the tab
      bg_color = "#24283b",
      fg_color = " #9699a3",
    },
    inactive_tab = {
      bg_color = "#1a1b26",
      fg_color = "#9699a3",
    },
  },
}

config.window_decorations = "RESIZE"
config.window_padding = {
  top = "0.5cell",
  left = "2cell",
  right = "0.5cell",
}

config.font = wezterm.font({
  family = "JetBrainsMono Nerd Font",
  weight = "Regular",
  italic = false,
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

config.font_size = 12
config.line_height = 1.25
config.cell_width = 1.05
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.95

-- config.disable_default_key_bindings = true

config.leader = { key = "a", mods = "CTRL" }
config.keys = {
  { key = "w", mods = "ALT", action = act.SendString("\x1bf") },
  { key = "b", mods = "ALT", action = act.SendString("\x1bb") },
  {
    key = "q",
    mods = "CMD",
    action = act.CloseCurrentPane({ confirm = false }),
  },

  { key = "h",  mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l",  mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "k",  mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "j",  mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "-",  mods = "LEADER", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  { key = "\\", mods = "LEADER", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "1",  mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
  { key = "2",  mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
  { key = "3",  mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
  { key = "4",  mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
  { key = "5",  mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
  { key = "6",  mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
  { key = "7",  mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
  { key = "8",  mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
  { key = "9",  mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
  { key = "x",  mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
  { key = "c",  mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
}

-- and finally, return the configuration to wezterm
return config
