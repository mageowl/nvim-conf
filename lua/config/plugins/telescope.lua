return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			local telescope = require("telescope")
			require("telescope.pickers.layout_strategies").horizontal_merged = function(picker, max_columns, max_lines, layout_config)
				local layout = require('telescope.pickers.layout_strategies').horizontal(picker, max_columns, max_lines, layout_config)
				layout.results.line = layout.results.line - 1
				layout.results.height = layout.results.height + 1
				layout.results.title = ''
				return layout
			end

			telescope.setup {
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					sorting_strategy = "ascending",
					preview_title = false,

					mappings = {
						i = {
							-- close telescope on first escape press, instead of exiting insert mode
							["<Esc>"] = "close",
						},
					},

					layout_strategy = "horizontal_merged",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
						},
						width = 0.87,
						height = 0.80,

					},
					borderchars = {
						{"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
						results = {"─", "│", "─", "│", "├", "┤", "╯", "╰"},
					},

					get_status_text = function(self)
						if self.stats.processed ~= nil then
							return string.format("%s / %s ", self.stats.processed - self.stats.filtered, self.stats.processed)
						else
							return ""
						end
					end
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_cursor()
					}
				}
			}

			telescope.load_extension("ui-select")
		end
	}
}
