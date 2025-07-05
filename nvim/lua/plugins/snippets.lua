-- lua/plugins/snippets.lua - Snippet Support
return {
	-- Snippet engine
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
	},

	-- Friendly snippets collection
	{
		"rafamadriz/friendly-snippets",
		lazy = true,
	},
}
