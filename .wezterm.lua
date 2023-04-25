-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Horizon Dark (base16)"
config.colors = {
  cursor_bg = "#abfcff",
}

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
  top = "1cell",
  left = "2cell",
  right = "2cell",
}
-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", italic = false })
config.font = wezterm.font({
  family = "JetBrainsMono Nerd Font",
  weight = "Regular",
  italic = false,
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

config.font_size = 12
config.line_height = 1.15
config.cell_width = 1.05
config.exit_behavior = "Close"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.95

-- config.disable_default_key_bindings = true
config.keys = {
  { key = "q", mods = "CMD", action = wezterm.action.QuitApplication },
  { key = "w", mods = "CTRL", action = wezterm.action.SendString '\x1bf' },
  { key = "b", mods = "CTRL", action = wezterm.action.SendString '\x1bb' },
}

-- and finally, return the configuration to wezterm
return config
