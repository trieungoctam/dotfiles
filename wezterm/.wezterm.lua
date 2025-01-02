local wezterm = require("wezterm")
local config = wezterm.config_builder()
local os = require("os")
local brightness = 0.08

-- image setting
local user_home = os.getenv("HOME")
config.window_background_image_hsb = {
	-- Darken the background image by reducing it
	brightness = brightness,
	hue = 1.0,
	saturation = 0.8,
}

-- default background
local bg_image = user_home .. "/.config/bg/bg.png"
config.window_background_image = bg_image
-- end image setting

-- window setting
config.window_background_opacity = 0.92
config.macos_window_background_blur = 85
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.color_scheme = "Tokyo Night"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 13
config.line_height = 1.2

config.window_decorations = "RESIZE"
-- config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = false

config.window_frame = {
	border_left_width = "0.28cell",
	border_right_width = "0.28cell",
	border_bottom_height = "0.15cell",
	border_top_height = "0.15cell",
	border_left_color = "pink",
	border_right_color = "pink",
	border_bottom_color = "pink",
	border_top_color = "pink",
}

-- keys
config.keys = {
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	{
		key = ">",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window)
			brightness = math.min(brightness + 0.01, 1.0)
			window:set_config_overrides({
				window_background_image_hsb = {
					brightness = brightness,
					hue = 1.0,
					saturation = 0.8,
				},
				window_background_image = bg_image,
			})
		end),
	},
	{
		key = "<",
		mods = "CTRL|SHIFT",
		action = wezterm.action_callback(function(window)
			brightness = math.max(brightness - 0.01, 0.01)
			window:set_config_overrides({
				window_background_image_hsb = {
					brightness = brightness,
					hue = 1.0,
					saturation = 0.8,
				},
				window_background_image = bg_image,
			})
		end),
	},
}

-- others
config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = 2
return config
