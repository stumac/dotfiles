local wezterm = require("wezterm")
-- stolen from: https://gist.github.com/Zbizu/43df621b3cd0dc460a76f7fe5aa87f30
local getOS = function()
	-- ask LuaJIT first
	if jit then
		return jit.os
	end
	-- Unix, Linux variants
	local fh, _ = assert(io.popen("uname -o 2>/dev/null", "r"))
	if fh then
		osname = fh:read()
	end
	return osname or "Windows"
end
-- This table will hold the configuration

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

-- if we're on our WSL machine (or windows in general I guess) then we want to
-- try to have the default domain as WSL:Ubuntu. I can't foresee when we'd want
-- to have powershell or something with wez, but I guess it's possible. That's
-- a future me problem though
if getOS() == "Windows" then
	--is this even going to work?
	-- has not been tried with macos/linux yet. So....be mindful
	config.default_domain = "WSL:Ubuntu"
end

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
