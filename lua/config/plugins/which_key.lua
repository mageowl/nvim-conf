return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "modern",
			delay = 200,
			icons = {
				mappings = false,
			},
		})

		wk.add({
			{ "<leader>f", group = "search" },
			{ "<leader>l", group = "lsp" },
		})
	end,
}
