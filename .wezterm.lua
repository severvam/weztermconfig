local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Ubuntu'

config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 13
config.line_height = 1.1

config.window_background_opacity = 0.8
config.macos_window_background_blur = 60

config.initial_rows = 30
config.initial_cols = 140

config.window_frame = {
 font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
}


local act = wezterm.action

config.keys = {
  { key = 'LeftArrow', mods = 'OPT', action = act.SendKey { key = 'b', mods = 'ALT', }, },
  { key = 'RightArrow', mods = 'OPT', action = act.SendKey { key = 'f', mods = 'ALT' }, },
  { key = 'w', mods = 'CMD', action = act.CloseCurrentTab{ confirm = false }, },
  { key = 'v', mods = 'CMD', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'h', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection 'Left', },
  { key = 'r', mods = 'CMD', action = act.ActivatePaneDirection 'Right', },
  { key = 'd', mods = 'CMD', action = act.ActivatePaneDirection 'Down', },
  { key = 'u', mods = 'CMD', action = act.ActivatePaneDirection 'Up', },
  { key = 'x', mods = 'CMD', action = act.CloseCurrentPane{ confirm = false } },
  { key = 'f', mods = 'CMD', action = wezterm.action.Search { CaseSensitiveString = "" }, },
}


return config
