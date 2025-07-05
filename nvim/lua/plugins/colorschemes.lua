-- lua/plugins/colorschemes.lua - Color Schemes
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm", -- storm, moon, night, day
				transparent = true, -- Enable transparency
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "transparent", -- Make sidebars transparent
					floats = "transparent", -- Make floating windows transparent
				},
				sidebars = { "qf", "help" },
				day_brightness = 0.3,
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = false,
				-- Custom highlight overrides
				on_highlights = function(hl, c)
					-- Make line numbers lighter/more subtle
					hl.LineNr = {
						fg = "#565f89", -- Lighter gray-blue
					}
					hl.CursorLineNr = {
						fg = "#7aa2f7", -- Blue accent for current line
						bold = true,
					}
				end,
			})
			-- Force load tokyonight immediately
			vim.cmd.colorscheme("tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		priority = 500,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
				integrations = {
					telescope = true,
					treesitter = true,
					gitsigns = true,
				},
			})
		end,
	},
}
