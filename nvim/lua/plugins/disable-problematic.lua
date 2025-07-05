-- lua/plugins/disable-problematic.lua - Disable Invalid/Problematic Plugins
return {
	-- Disable invalid or problematic plugins
	{ "saghen/blink.cmp", enabled = false },
	{ "altercation/vim-colors-solarized", enabled = false },
	{ "chriskempson/vim-tomorrow-theme", enabled = false },
	-- Remove f2f-lua as it's not a valid plugin
}
