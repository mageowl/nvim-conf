return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"letieu/harpoon-lualine",
	},
	event = "User ColorsLoaded",
	config = function()
		local colors = vim.g.colors

		local bubbles_theme = {
			normal = {
				a = { fg = colors.base, bg = colors.mauve, gui = "bold" },
				b = { fg = colors.text, bg = colors.mantle },
				c = { fg = colors.text },
			},

			insert = { a = { fg = colors.base, bg = colors.blue, gui = "bold" } },
			visual = { a = { fg = colors.base, bg = colors.peach, gui = "bold" } },
			replace = { a = { fg = colors.base, bg = colors.red, gui = "bold" } },
			command = { a = { fg = colors.base, bg = colors.teal, gui = "bold" } },

			inactive = {
				a = { fg = colors.subtext0, bg = colors.mantle },
				b = { fg = colors.subtext0, bg = colors.mantle },
				c = { fg = colors.subtext0 },
			},
		}

		require("lualine").setup({
			options = {
				theme = bubbles_theme,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},

			sections = {
				lualine_a = { { "mode", separator = { left = "" }, padding = { right = 1 } } },
				lualine_b = { "filename", "branch" },
				lualine_c = {
					{
						"harpoon2",
						no_harpoon = "",
					},
				},

				lualine_x = { "searchcount" },
				lualine_y = { "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 1 },
				},
			},
		})
	end,
}
