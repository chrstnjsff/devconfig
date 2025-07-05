-- lua/plugins/core.lua - Core dependencies that need to load early
return {
	-- Essential dependency - load early
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Disable problematic plugins
	{ "saghen/blink.cmp", enabled = false },
	{ "altercation/vim-colors-solarized", enabled = false },
	{ "chriskempson/vim-tomorrow-theme", enabled = false },
}
