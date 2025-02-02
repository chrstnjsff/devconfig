-- init.lua
require("config.lazy") -- Load LazyVim and plugins

-- Verify Git is installed and working
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.executable("git") == 0 then
			vim.notify("Git not found! Gitsigns will not work without Git.", vim.log.levels.ERROR)
		end
	end,
})

-- Terraform configurations
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])

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
