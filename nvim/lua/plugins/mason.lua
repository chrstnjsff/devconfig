-- lua/plugins/mason.lua - LSP/Tool Management
return {
	-- Mason for managing LSP servers, DAP servers, linters, and formatters
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts = {
			ensure_installed = {
				-- LSP servers
				"lua-language-server",
				"terraform-ls",
				"typescript-language-server",
				"css-lsp",
				"html-lsp",
				"json-lsp",
				"yaml-language-server",
				"pyright",

				-- Formatters
				"stylua",
				"prettier",
				"black",

				-- Linters
				"luacheck",
				"shellcheck",
				"eslint_d",
			},
		},
	},

	-- Mason-lspconfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"mason.nvim",
			"nvim-lspconfig",
		},
		opts = {
			automatic_installation = true,
			ensure_installed = {
				"lua_ls",
				"terraformls",
				"tsserver",
				"cssls",
				"html",
				"jsonls",
				"yamlls",
				"pyright",
			},
		},
	},
}
