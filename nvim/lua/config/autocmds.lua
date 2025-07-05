-- lua/config/autocmds.lua
-- Additional autocmds (LazyVim loads default ones automatically)

-- Git verification check
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.executable("git") == 0 then
			vim.notify("Git not found! Gitsigns will not work without Git.", vim.log.levels.ERROR)
		end
	end,
})

-- Gitsigns verification check
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	pattern = "*",
	callback = function()
		if vim.b.gitsigns_head == nil then
			vim.schedule(function()
				if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null") == "true\n" then
					vim.notify("Gitsigns should be working now!", vim.log.levels.INFO)
				else
					vim.notify("Not a Git repository. Gitsigns requires a Git project.", vim.log.levels.WARN)
				end
			end)
		end
	end,
})

-- YAML-specific settings
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.yaml", "*.yml" },
	callback = function()
		vim.bo.filetype = "yaml"
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.expandtab = true
	end,
})

-- Terraform file type detection
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.bo.filetype = "terraform"
	end,
})

-- HCL file type detection
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.hcl", ".terraformrc", "terraform.rc" },
	callback = function()
		vim.bo.filetype = "hcl"
	end,
})

-- Terraform state files as JSON
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.tfstate", "*.tfstate.backup" },
	callback = function()
		vim.bo.filetype = "json"
	end,
})
