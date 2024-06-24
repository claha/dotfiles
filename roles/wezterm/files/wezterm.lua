local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Terminess Nerd Font Mono")
config.font_size = 16.0

config.background = {
	{
		source = {
			Color = "black",
		},
		width = "100%",
		height = "100%",
		opacity = 0.70,
	},
}

config.enable_tab_bar = false

config.default_prog = {
	"/usr/bin/bash",
}

return config
