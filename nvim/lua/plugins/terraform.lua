-- lua/plugins/terraform.lua - Terraform Support
return {
	{
		"hashivim/vim-terraform",
		ft = { "terraform", "tf", "terraform-vars", "hcl" },
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			-- Set terraform options
			vim.g.terraform_align = 1
			vim.g.terraform_fmt_on_save = 1

			-- Format-on-save autocmd
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.tf", "*.tfvars" },
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end,
	},
}
