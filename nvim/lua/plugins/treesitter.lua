-- lua/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"terraform",
			"hcl",
			"python",
			"json",
			"yaml",
			"javascript",
			"typescript",
			"html",
			"css",
			"bash",
			"markdown",
			"markdown_inline",
		},
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		auto_install = true,
	},
}
