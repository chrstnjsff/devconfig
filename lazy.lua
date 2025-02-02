-- Define the path to lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Bootstrap lazy.nvim if it's not already installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
-- Prepend the lazy.nvim path to runtime path
vim.opt.rtp:prepend(lazypath)

-- Disable LSP logging
vim.lsp.set_log_level("OFF")

-- Configure and setup lazy.nvim
require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "plugins" }, -- Load custom plugins from the plugins directory

		-- Colorschemes
		{ "morhetz/gruvbox", lazy = true },
		{ "altercation/vim-colors-solarized", lazy = true },
		{ "catppuccin/nvim", name = "catppuccin", lazy = true },
		{ "folke/tokyonight.nvim", lazy = true },
		{ "Mofiqul/dracula.nvim", lazy = true },
		{ "Mofiqul/vscode.nvim", lazy = true },
		{ "chriskempson/vim-tomorrow-theme", lazy = true },

		-- Terraform setup
		{
			"hashivim/vim-terraform",
			ft = { "terraform", "tf", "terraform-vars" },
			config = function()
				vim.cmd([[
                    let g:terraform_align = 1
                    let g:terraform_fmt_on_save = 1
                ]])
			end,
		},

		-- Other plugins
		{ "elzr/vim-json" },
		{ "stephpy/vim-yaml" },
		{ "vim-python/python-syntax" },
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = { "lua", "vim", "vimdoc", "terraform", "hcl", "python", "json", "yaml" },
					auto_install = true,
					highlight = { enable = true },
				})
			end,
		},
		{ "neovim/nvim-lspconfig" },
		{ "lewis6991/gitsigns.nvim" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	install = {
		colorscheme = { "tokyonight" },
	},
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- Apply the colorscheme
vim.cmd("colorscheme tokyonight")

-- Apply custom highlight settings
vim.cmd([[ highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Black gui=NONE guifg=DarkGrey guibg=Black ]])

-- Add custom key mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Configure gitsigns
require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 1000,
		virt_text_pos = "eol",
	},
	current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
})

-- Setup terraform LSP
require("lspconfig").terraformls.setup({})

-- Autocommands for terraform files
vim.cmd([[
    autocmd BufRead,BufNewFile *.tf set filetype=terraform
    autocmd BufRead,BufNewFile *.tfvars set filetype=terraform
]])
