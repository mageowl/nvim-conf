return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local wk = require("which-key")
		wk.add({
			{"<leader>f", group = "search"}
		})

		return {
			preset = "modern",
			delay = 200
		}
	end
}
