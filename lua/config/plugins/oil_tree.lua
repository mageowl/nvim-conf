return {
	"stevearc/oil.nvim",
	opts = {
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		keymaps = {
			["<Backspace>"] = "actions.parent",
		},
	},
	lazy = false,
	cmd = { "Ex" },
	dependencies = {
		{ "echasnovski/mini.icons", opts = true },
	},
}
