return {
	"stevearc/oil.nvim",
	opts = {
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
	},
	lazy = false,
	cmd = { "Ex" },
	dependencies = {
		{ "echasnovski/mini.icons", opts = true },
	},
}
