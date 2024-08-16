local wezterm = require("wezterm");
local config = wezterm.config_builder();
local appearance = require("appearance");

if appearance.is_dark() then
  config.color_scheme = 'Tokyo Night Storm'
else
  config.color_scheme = 'Tokyo Night Day'
end

config.font_size = 16;
config.font = wezterm.font("JetBrainsMono Nerd Font");
config.tab_bar_at_bottom = true;
config.show_tab_index_in_tab_bar = false;

config.window_frame = {
  font = wezterm.font({ family = 'JetBrainsMono Nerd Font', weight = 'Bold' }),
  font_size = 16,
}

return config;
