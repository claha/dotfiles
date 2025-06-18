local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Terminess Nerd Font Mono")
config.font_size = 20.0
config.warn_about_missing_glyphs = false

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
config.window_padding = {
  left = 5,
  right = 5,
  top = 5,
  bottom = 5,
}

config.default_prog = {
  "/usr/bin/bash",
}

config.window_close_confirmation = "NeverPrompt"

config.keys = {
  {
    key = "S",
    mods = "CTRL",
    action = wezterm.action.QuickSelectArgs({
      patterns = {
        "[0-9a-f]{7,40}",
      },
    }),
  },
}

return config
