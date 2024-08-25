return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			color_overrides = {
				mocha = {
					base = "#000000",
				},
			},
		},
		lazy = true,
	},

	{
		"decaycs/decay.nvim",
		name = "decay",
		opts = {
			style = "dark",
			palette_overrides = {
				background = "#000000",
			},
		},
		lazy = true,
	},
}
