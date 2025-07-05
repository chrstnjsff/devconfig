-- lua/config/lazy.lua
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)

-- Disable LSP logging
vim.lsp.set_log_level("OFF")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Import LazyVim and its plugins
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- Import custom plugins from plugins directory
		{ import = "plugins" },
	},
	defaults = {
		lazy = false,
		version = false,
	},
	install = {
		colorscheme = { "tokyonight" }, -- Changed back to tokyonight
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

-- Enable true colors
vim.opt.termguicolors = true
