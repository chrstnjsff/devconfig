return {
	{
		"hashivim/vim-terraform",
		ft = "terraform",
		dependencies = { "neovim/nvim-lspconfig" }, -- Add explicit dependency
		init = function()
			-- Format-on-save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*.tf,*.tfvars",
				callback = function()
					vim.lsp.buf.format()
				end,
			})
		end,
		config = function() -- Use config instead of init for LSP setup
			require("lspconfig").terraformls.setup({
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				filetypes = { "terraform", "tf", "terraform-vars" },
			})
		end,
	},
}
