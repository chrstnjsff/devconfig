-- lua/config/plugins/cmp.lua
return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-path", -- Add this line
		"hrsh7th/cmp-emoji",
	},
	opts = function(_, opts)
		-- Ensure path is in sources
		table.insert(opts.sources, { name = "path" })
		table.insert(opts.sources, { name = "emoji" })
		return opts
	end,
}
