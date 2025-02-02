-- lua/config/plugins/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"hcl",
				"terraform",
				"yaml",
			},
			auto_install = true,
		},
		build = ":TSUpdate",
	},
}
