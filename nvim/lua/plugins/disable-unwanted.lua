-- lua/plugins/disable-unwanted.lua - Disable only unwanted plugins
return {
	-- Disable unwanted colorschemes only
	{ "altercation/vim-colors-solarized", enabled = false },
	{ "chriskempson/vim-tomorrow-theme", enabled = false },

	-- Keep blink.cmp disabled since you're using nvim-cmp
	{ "saghen/blink.cmp", enabled = false },
}
