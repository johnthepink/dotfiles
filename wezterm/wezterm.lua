local wezterm = require("wezterm")

return {
	term = "wezterm",

	-- color_scheme = "tokyonight",

	font_size = 16,
	font = wezterm.font("JetBrainsMono Nerd Font"),
	color_scheme_dirs = { "~/.config/wezterm" },
	color_scheme = "tokyonight_storm",

	use_fancy_tab_bar = true,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
}
