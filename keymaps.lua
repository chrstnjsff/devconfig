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

vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })

-- Add to existing keymaps:
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)
