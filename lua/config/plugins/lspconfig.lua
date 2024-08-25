local servers = { "tsserver", "rust_analyzer" }
local prettier = { { "prettierd", "prettier" } } -- perfer prettier daemon over normal prettier

return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },

				javascript = prettier,
				javascriptreact = prettier,
				typescript = prettier,
				typescriptreact = prettier,
				html = prettier,
				scss = prettier,
				json = prettier,
				css = prettier,

				rust = { "rustfmt" }
			}
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					{
						"williamboman/mason.nvim",
						cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
						opts = {
							ui = {
								icons = {
									package_pending = " ",
									package_installed = " ",
									package_uninstalled = " ",
								},
							},
						},
					},
				},
				event = { "BufReadPost", "BufNewFile" },
				config = {
					ensure_installed = servers,
				},
			},
			"hrsh7th/cmp-nvim-lsp"
		},
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "LspInfo" },
		config = function()
			local lspconfig = require("lspconfig")
			local on_attach = function(_, bufnr)
				local function opts(desc)
					return { buffer = bufnr, desc = "LSP: " .. desc }
				end
				local map = vim.keymap.set

				map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
				map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
				map("n", "<leader>li", vim.lsp.buf.signature_help, opts "Show function signature")
				map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts "Code action")
				map({ "n", "v" }, "<leader>lr", vim.lsp.buf.rename, opts "Rename symbol")
			end


			lspconfig.lua_ls.setup {
				on_attach = on_attach,
				settings = {
					Lua = {
						diagonostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								vim.fn.expand("$VIMRUNTIME/lua"),
								vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
								vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
								"${3rd}/luv/library",
							},
						},
						maxPreload = 100000,
          				preloadFileSize = 10000,
					},
				},
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					on_attach = on_attach,
				}
			end
		end
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
}
