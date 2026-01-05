local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Ubuntu'

config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 13
config.line_height = 1.1

config.window_background_opacity = 0.8

config.initial_rows = 30
config.initial_cols = 140

config.window_frame = {
  font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
}

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
wezterm.on("format-tab-title", function(tab)
  return tab.active_pane.title
end)

-- Platform-specific settings
if wezterm.target_triple:find("darwin") then
  config.macos_window_background_blur = 60
elseif wezterm.target_triple:find("windows") then
   -- Additional Windows-specific settings (if any)
elseif wezterm.target_triple:find("linux") then
  -- Additional Linux-specific settings (if any)
end


local act = wezterm.action

local cmd_key_mods = "CTRL|SHIFT"
local opt_key_mods = "ALT"
if wezterm.target_triple:find("darwin") then
  cmd_key_mods = "CMD|SHIFT"
  opt_key_mods = "OPT"
end

config.keys = {
  { key = "Enter", mods = "SHIFT", action = act.SendString "\x1b\r" },
  { key = 'LeftArrow', mods = opt_key_mods, action = act.SendKey { key = 'b', mods = 'ALT' } },
  { key = 'RightArrow', mods = opt_key_mods, action = act.SendKey { key = 'f', mods = 'ALT' } },
  { key = 'w', mods = cmd_key_mods, action = act.CloseCurrentTab { confirm = false } },
  { key = 'v', mods = cmd_key_mods, action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'h', mods = cmd_key_mods, action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'l', mods = cmd_key_mods, action = act.ActivatePaneDirection 'Left' },
  { key = 'r', mods = cmd_key_mods, action = act.ActivatePaneDirection 'Right' },
  { key = 'd', mods = cmd_key_mods, action = act.ActivatePaneDirection 'Down' },
  { key = 'u', mods = cmd_key_mods, action = act.ActivatePaneDirection 'Up' },
  { key = 'x', mods = cmd_key_mods, action = act.CloseCurrentPane { confirm = false } },
  { key = 'f', mods = cmd_key_mods, action = wezterm.action.Search { CaseSensitiveString = "" } },
  -- switch active tab
  { key = '[', mods = cmd_key_mods, action = act.ActivateTabRelative(-1) },
  { key = ']', mods = cmd_key_mods, action = act.ActivateTabRelative(1) },
}

return config
