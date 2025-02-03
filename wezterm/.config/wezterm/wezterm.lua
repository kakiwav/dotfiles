-- Use Wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- Creates the table that holds the config
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Color scheme
config.color_scheme = "terafox"

-- Sets the font
config.font = wezterm.font("JetBrains Mono NL")
config.font_size = 16

-- Window settings
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.9
config.window_padding = {
  left = "1cell",
  right = "0",
  top = "0.5cell",
  bottom = "0",
}

-- Keybinds
config.keys = {
  {key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain")},
  {key = "[", mods = "CTRL", action = act.ActivateTabRelative(-1)},
  {key = "]", mods = "CTRL", action = act.ActivateTabRelative(1)},
  {key = "n", mods = "CTRL", action = act.ShowTabNavigator},
}

return config
