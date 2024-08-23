return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "mocha",
			color_overrides = {
				mocha = {
					base = "#000000",
					-- mantle = "#000000",
					-- crust = "#000000",
				}
			},
			custom_highlights = function(colors)
				return require("config.highlights").with_palette(colors)
			end,
		},
	}
}
