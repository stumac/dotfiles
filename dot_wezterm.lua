local wezterm = require("wezterm")

-- This table will hold the ocnfiguration

local config = {}

-- future proof wez configs
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback({
	{
		family = "Fira Code",
		weight = "Medium",
		freetype_render_target = "HorizontalLcd",
	},
})
--#region time to actually do things
--config.font = wezterm.font_with_fallback {
--    'Fira Code',
--    'JetBrains Mono',
--}
-- wait this works?
-- config.automatically_reload_config = true
--config.colors = {
--    background = '#1e2030',
--    foreground = '#c8d3f5',
--}

-- The art is a bit too bright and colorful to be useful as a backdrop
-- for text, so we're going to dim it down to 10% of its normal brightness
local dimmer = { brightness = 0.01 }

--is this even going to work?
-- config.default_domain = 'WSL:Ubuntu'
config.font_size = 14
config.color_scheme = "Tokyo Night Moon"
-- config.window_background_opacity = 1.0
-- config.background = {
-- 	{
-- 		source = {
-- 			File = wezterm.home_dir .. "/mountains-1.png",
-- 		},
-- 		width = "Cover",
-- 		hsb = dimmer,
-- 	},
-- }
--#endregion

return config
