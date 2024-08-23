local vimcmd = function(cmd)
	return function()
		vim.cmd(cmd)
	end
end

local map = vim.keymap.set
map({ "n", "v" }, ";", ":", { desc = "Alias for command mode" })

-- Insert mode
map("i", "<C-Enter>", "<Esc>o", { desc = "Append a new line below" })
map("i", "<C-S-Enter>", "<Esc>O", { desc = "Append a new line above" })
map("i", "<C-b>", "<Esc>I", { desc = "Jump to the beginning of the current line" })

map("i", "<M-h>", "<Left>")
map("i", "<M-j>", "<Down>")
map("i", "<M-k>", "<Up>")
map("i", "<M-l>", "<Right>")
map("i", "<M-w>", "<C-Right>")

-- Jump between windows
map("n", "<C-h>", vimcmd("wincmd h"), { desc = "Go to the left window"})
map("n", "<C-j>", vimcmd("wincmd j"), { desc = "Go to the down window" })
map("n", "<C-k>", vimcmd("wincmd k"), { desc = "Go to the up window" })
map("n", "<C-l>", vimcmd("wincmd l"), { desc = "Go to the right window" })

-- Recording
map("n", ".", "@a", { desc = "Run temporary macro (@a)" })

-- Telescope
local telescope = require("telescope.builtin")
map("n", "<leader><leader>", telescope.find_files, { desc = "Find files" })
map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Search help pages" })
map("n", "<leader>fw", telescope.live_grep, { desc = "Live grep" })
