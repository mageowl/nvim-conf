return {
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = { char = "│" },
			scope = { enabled = true, char = "│" },
		},
		main = "ibl",
	},
	{
		"mbbill/undotree",
		keys = {
			-- load the plugin only when using it's keybinding:
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle undo tree" },
		},
	},
}
