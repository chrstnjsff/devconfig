-- lua/config/plugins/lsp.lua
return {
	-- Mason (LSP installer)
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"terraform-ls",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"typescript-language-server",
				"css-lsp",
			},
		},
	},

	-- LSP configurations
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = true },
			servers = {
				-- Your existing LSP server configurations
				-- (Keep the tsserver, lua_ls, etc. configs you shared)
			},
		},
	},
}
