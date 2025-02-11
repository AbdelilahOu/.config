-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color"

config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono")
config.cell_width = 0.9
config.window_background_opacity = 0.9
config.prefer_egl = true
config.font_size = 14.0

config.window_padding = {
	left = 1,
	right = 1,
	top = 1,
	bottom = 0,
}

-- tabs
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true

config.inactive_pane_hsb = {
	saturation = 0.0,
	brightness = 1.0,
}


-- color scheme toggling (disabled for grayscale)
-- wezterm.on("toggle-colorscheme", function(window, pane)
-- 	local overrides = window:get_config_overrides() or {}
-- 	if overrides.color_scheme == "Zenburn" then
-- 		overrides.color_scheme = "Cloud (terminal.sexy)"
-- 	else
-- 		overrides.color_scheme = "Zenburn"
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

-- keymaps (modified to remove color scheme toggle)
config.keys = {
	-- Remove or comment out the color scheme toggle keybind
	--{
	--	key = "E",
	--	mods = "CTRL|SHIFT|ALT",
	--	action = wezterm.action.EmitEvent("toggle-colorscheme"),
	--},
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},
	{
		key = "U",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "I",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "O",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{ key = "9", mods = "CTRL", action = act.PaneSelect },
	{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
	{
		key = "O",
		mods = "CTRL|ALT",
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.9
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}

-- Grayscale color definitions
local black   = "#000000"
local white   = "#FFFFFF"
local gray20  = "#333333"
local gray70  = "#B3B3B3"
local gray90  = "#E6E6E6"

config.color_scheme = "Cloud (terminal.sexy)"  -- Set a descriptive color scheme name

config.colors = {
	background = black,  -- Solid black background
	foreground = gray70,  -- Light gray text
	cursor_border = gray70,
	cursor_bg = gray70,
	cursor_fg = black,
	selection_bg = gray20, -- Slightly lighter selection
	selection_fg = gray90,

  -- ANSI colors - standard colors
  ansi = { black, gray20, gray20, gray70, gray20, gray70, gray20, gray70 },

  -- ANSI colors - bright colors
  brights = { gray20, gray70, gray70, white, gray70, white, gray70, white },


	tab_bar = {
		background = black,
		active_tab = {
			bg_color = black,
			fg_color = white,
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = black,  -- Inactive tabs also black
			fg_color = gray70,
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		new_tab = {
			bg_color = black,
			fg_color = white,
		},
	},
}

config.window_frame = {
	font = wezterm.font({ family = "JetBrainsMonoNL Nerd Font Mono", weight = "Regular" }),
	active_titlebar_bg = black,
}

config.window_decorations = "NONE | RESIZE"
config.default_prog = { "cmd.exe", "-NoLogo" }
config.initial_cols = 80


-- and finally, return the configuration to wezterm
return config
