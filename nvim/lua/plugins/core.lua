-- lua/plugins/core.lua - Core dependencies that need to load early
return {
	-- Essential dependency - load early
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Only disable these if they cause issues
	{ "altercation/vim-colors-solarized", enabled = false },
	{ "chriskempson/vim-tomorrow-theme", enabled = false },
}
