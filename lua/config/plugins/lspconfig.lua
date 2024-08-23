local servers = { "tsserver", "rust_analyzer" }

return {
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
		}
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = {
			ensure_installed = servers,
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
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
	}
}
