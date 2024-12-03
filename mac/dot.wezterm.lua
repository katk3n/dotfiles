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

return config
