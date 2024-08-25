local colors = {
	["decay-dark"] = function()
		return require("decay.core").get_colors("dark")
	end,
	["catppuccin-mocha"] = function()
		local palette = require("catppuccin.palettes.mocha")
		return vim.tbl_extend("force", palette, { base = "#000000" })
	end,
}

return function(name)
	if colors[name] then
		vim.cmd.colorscheme(name)
		vim.g.colors = colors[name]()

		vim.api.nvim_exec_autocmds("User", { pattern = "ColorsLoaded" })
	end
end
