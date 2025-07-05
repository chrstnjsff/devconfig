-- lua/config/keymaps.lua
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- LSP formatting
keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)

-- Telescope file navigation (using functions to ensure telescope is loaded)
keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find Files" })

keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Live Grep" })

keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { desc = "Buffers" })

keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { desc = "Help Tags" })

keymap.set("n", "<leader>sk", function()
	require("telescope.builtin").keymaps()
end, { desc = "Search Keymaps" })

-- Additional useful Telescope keymaps
keymap.set("n", "<leader>fd", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Find Files in Current Directory" })

keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })
end, { desc = "Find Files in Root" })

keymap.set("n", "<leader>fr", function()
	require("telescope.builtin").oldfiles()
end, { desc = "Recent Files" })

-- Directory browser function
local function browse_directories()
	require("telescope.builtin").find_files({
		prompt_title = "Browse Directories",
		find_command = { "find", ".", "-type", "d", "-not", "-path", "*/.*" },
		attach_mappings = function(prompt_bufnr, map)
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)
				vim.cmd("cd " .. selection.value)
				vim.notify("Changed directory to: " .. selection.value)
			end)
			return true
		end,
	})
end

keymap.set("n", "<leader>fD", browse_directories, { desc = "Browse and Change Directory" })

-- Buffer navigation (using different keys to avoid Tab conflicts)
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", opts)
keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", opts)

-- Use different keys for buffer navigation to avoid conflicts with completion
keymap.set("n", "<A-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
keymap.set("n", "<A-h>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })

-- Neo-tree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)

-- Alternative Telescope keymap
keymap.set("n", "<C-p>", function()
	require("telescope.builtin").find_files()
end, { desc = "Find Files" })

-- Quick directory navigation
keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr><cmd>pwd<cr>", { desc = "Change to file directory" })
keymap.set("n", "<leader>cD", "<cmd>cd -<cr><cmd>pwd<cr>", { desc = "Change to previous directory" })

-- Zoom function (tmux-like zoom)
local zoomed = false
local zoom_winid = nil

function _G.toggle_zoom()
	if zoomed then
		-- Restore: go back to the zoomed window and equalize
		if zoom_winid and vim.api.nvim_win_is_valid(zoom_winid) then
			vim.api.nvim_set_current_win(zoom_winid)
		end
		vim.cmd("wincmd =")
		zoomed = false
		zoom_winid = nil
	else
		-- Zoom: maximize current window
		zoom_winid = vim.api.nvim_get_current_win()
		vim.cmd("wincmd |")
		vim.cmd("wincmd _")
		zoomed = true
	end
end

-- Zoom keybinding
keymap.set("n", "<C-w>z", "<cmd>lua toggle_zoom()<CR>", { desc = "Toggle zoom current window" })
