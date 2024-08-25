local function cmd(name, callback, opts)
	vim.api.nvim_create_user_command(name, callback, opts or {})
end

cmd("Ex", function(_)
	local dir = vim.fn.expand("%:h")
	if dir == "" then
		dir = vim.fn.getcwd()
	end

	vim.cmd.edit(dir)
end)
