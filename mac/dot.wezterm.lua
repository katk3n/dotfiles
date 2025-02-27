local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = "tokyonight"
config.window_background_opacity = 0.90
--config.font = wezterm.font("Hack Nerd Font Mono", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font = wezterm.font("HackGen35 Console NF", { weight = "Medium", stretch = "Normal", style = "Normal" })
config.font_size = 14

config.leader = {
  key = "q",
  mods = "CTRL",
  timeout_milliseconds = 2000,
}

config.keys = {
  {
    mods = "LEADER",
    key = "s",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "v",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "p",
    action = wezterm.action.PaneSelect,
  },
  {
    mods = "LEADER",
    key = "h",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    mods = "LEADER",
    key = "j",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  {
    mods = "LEADER",
    key = "k",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    mods = "LEADER",
    key = "l",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    mods = "CMD|CTRL|SHIFT",
    key = "h",
    action = wezterm.action.AdjustPaneSize { "Left", 2 },
  },
  {
    mods = "CMD|CTRL|SHIFT",
    key = "j",
    action = wezterm.action.AdjustPaneSize { "Down", 2 },
  },
  {
    mods = "CMD|CTRL|SHIFT",
    key = "k",
    action = wezterm.action.AdjustPaneSize { "Up", 2 },
  },
  {
    mods = "CMD|CTRL|SHIFT",
    key = "l",
    action = wezterm.action.AdjustPaneSize { "Right", 2 },
  },
}

return config
