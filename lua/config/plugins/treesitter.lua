return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "vimdoc", "vim", "lua", "rust", "typescript", "markdown" },
		auto_install = true,
		highlight = {
			enable = true,
		}
	},
	main = "nvim-treesitter.configs"
}
