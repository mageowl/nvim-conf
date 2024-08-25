local ui_config = {
	border = "rounded",
	title = "   ",
	title_pos = "center",
	ui_width_ratio = 0.3,
}

local keys = {
	{
		mode = "n",
		"<leader>h",
		function()
			require("harpoon").ui:toggle_quick_menu(require("harpoon"):list(), ui_config)
		end,
		desc = "Open harpoon window",
	},
	{
		mode = "n",
		"<leader>a",
		function()
			require("harpoon"):list():add()
			print("Added " .. vim.fn.expand("%") .. " to harpoon.")
		end,
		desc = "Add file to harpoon",
	},
	{
		mode = "n",
		"<leader>x",
		function()
			require("harpoon"):list():remove()
			print("Removed " .. vim.fn.expand("%") .. " from harpoon.")
			vim.api.nvim_buf_delete(0, { unload = true })
		end,
		desc = "Close buffer.",
	},
}

for i = 1, 9 do
	table.insert(keys, {
		mode = "n",
		"<C-" .. tostring(i) .. ">",
		function()
			require("harpoon"):list():select(i)
		end,
	})
end

return {
	"thePrimeagen/harpoon",
	branch = "harpoon2",
	keys = keys,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
}
