-- lua/config/keymaps.lua
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- LSP formatting
keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)

-- Telescope file navigation
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<leader>fp", "<cmd>Telescope live_grep<cr>", opts)

-- Buffer navigation
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", opts)
keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", opts)
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })

-- Neo-tree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)

-- Telescope keymaps (additional)
local builtin = require("telescope.builtin")
keymap.set("n", "<C-p>", builtin.find_files, {})
keymap.set("n", "<leader>fg", builtin.live_grep, {})
keymap.set("n", "<leader>fb", builtin.buffers, {})
keymap.set("n", "<leader>fh", builtin.help_tags, {})

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
