-- lua/plugins/neo-tree.lua - File Explorer
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
		{ "<leader>fe", "<cmd>Neotree focus<cr>", desc = "Focus file explorer" },
	},
	config = function()
		require("neo-tree").setup({
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			add_blank_line_at_top = false,
			auto_clean_after_session_restore = false,
			close_if_last_window = false,
			default_source = "filesystem",
			enable_diagnostics = true,
			enable_git_status = true,
			enable_modified_markers = true,
			enable_opened_markers = true,
			enable_refresh_on_write = true,
			enable_cursor_hijack = false,
			git_status_async = true,
			git_status_async_options = {
				batch_size = 1000,
				batch_delay = 10,
				max_lines = 10000,
			},
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
			},
			window = {
				width = 30,
				mappings = {
					["<space>"] = "none",
				},
			},
		})
	end,
}
