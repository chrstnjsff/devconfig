-- lua/plugins/lsp.lua - Complete LSP Configuration
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			-- LazyVim will handle cmp capabilities automatically
			-- We just need to configure our servers
			local lspconfig = require("lspconfig")

			-- Setup LSP servers
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				terraformls = {
					filetypes = { "terraform", "tf", "terraform-vars" },
				},
				tsserver = {},
				pyright = {},
				jsonls = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
				-- Additional servers
				cssls = {},
				html = {},
			}

			-- Setup each server (LazyVim will add capabilities automatically)
			for server, config in pairs(servers) do
				lspconfig[server].setup(config)
			end

			-- Global diagnostic mappings
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix" })

			-- LSP keymaps (only when LSP is attached)
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					-- Navigation
					vim.keymap.set(
						"n",
						"gD",
						vim.lsp.buf.declaration,
						vim.tbl_extend("force", opts, { desc = "Go to declaration" })
					)
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						vim.tbl_extend("force", opts, { desc = "Go to definition" })
					)
					vim.keymap.set(
						"n",
						"K",
						vim.lsp.buf.hover,
						vim.tbl_extend("force", opts, { desc = "Hover documentation" })
					)
					vim.keymap.set(
						"n",
						"gi",
						vim.lsp.buf.implementation,
						vim.tbl_extend("force", opts, { desc = "Go to implementation" })
					)
					vim.keymap.set(
						"n",
						"gr",
						vim.lsp.buf.references,
						vim.tbl_extend("force", opts, { desc = "Go to references" })
					)
					vim.keymap.set(
						"n",
						"<leader>D",
						vim.lsp.buf.type_definition,
						vim.tbl_extend("force", opts, { desc = "Type definition" })
					)

					-- Actions
					vim.keymap.set(
						"n",
						"<leader>rn",
						vim.lsp.buf.rename,
						vim.tbl_extend("force", opts, { desc = "Rename symbol" })
					)
					vim.keymap.set(
						{ "n", "v" },
						"<leader>ca",
						vim.lsp.buf.code_action,
						vim.tbl_extend("force", opts, { desc = "Code action" })
					)
					vim.keymap.set("n", "<leader>fm", function()
						vim.lsp.buf.format({ async = true })
					end, vim.tbl_extend("force", opts, { desc = "Format document" }))

					-- Signature help
					vim.keymap.set(
						"n",
						"<C-k>",
						vim.lsp.buf.signature_help,
						vim.tbl_extend("force", opts, { desc = "Signature help" })
					)

					-- Workspace folders
					vim.keymap.set(
						"n",
						"<leader>wa",
						vim.lsp.buf.add_workspace_folder,
						vim.tbl_extend("force", opts, { desc = "Add workspace folder" })
					)
					vim.keymap.set(
						"n",
						"<leader>wr",
						vim.lsp.buf.remove_workspace_folder,
						vim.tbl_extend("force", opts, { desc = "Remove workspace folder" })
					)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))
				end,
			})

			-- Configure diagnostic display
			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					source = true, -- Show source in virtual text
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = true, -- Show source in float
					header = "",
					prefix = "",
				},
			})

			-- Configure LSP UI
			require("lspconfig.ui.windows").default_options.border = "rounded"
		end,
	},
}
