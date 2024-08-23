local cmd = vim.api.nvim_create_autocmd

-- Add line numbers to telescope
cmd("User", {
	pattern = "TelescopePreviewerLoaded",
	command = "setlocal number",
})
