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
		config = true,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		lazy = false,
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
							},
						},
					},
				},
			}
		end
	}
}
