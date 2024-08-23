return {
	"kdheepak/lazygit.nvim",
	requires = {
		"nvim-lua/plenary.nvim"
	},

	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile"
	},
	keys = {
		{ "<leader>g", "<cmd>LazyGit<cr>", desc = "Open Lazy Git" }
	},
}
