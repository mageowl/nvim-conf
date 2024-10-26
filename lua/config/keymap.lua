local vimcmd = function(cmd, ...)
	local vargs = { ... }
	return function()
		vim.cmd[cmd](table.unpack(vargs))
	end
end

local map = vim.keymap.set
map({ "n", "v" }, ";", ":", { desc = "Alias for command mode" })

-- Insert mode
map("i", "<C-CR>", "<Esc>o", { desc = "Append a new line below" })
map("i", "<C-S-CR>", "<Esc>O", { desc = "Append a new line above" })
map("i", "<C-b>", "<Esc>I", { desc = "Jump to the beginning of the current line" })

map("i", "<M-h>", "<Left>")
map("i", "<M-j>", "<Down>")
map("i", "<M-k>", "<Up>")
map("i", "<M-l>", "<Right>")
map("i", "<M-w>", "<C-Right>")

-- Jump between windows
map("n", "<C-h>", vimcmd("wincmd", "h"), { desc = "Go to the left window" })
map("n", "<C-j>", vimcmd("wincmd", "j"), { desc = "Go to the down window" })
map("n", "<C-k>", vimcmd("wincmd", "k"), { desc = "Go to the up window" })
map("n", "<C-l>", vimcmd("wincmd", "l"), { desc = "Go to the right window" })

-- Telescope
local telescope = require("telescope.builtin")
map("n", "<leader><leader>", telescope.find_files, { desc = "Find files" })
map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Search help pages" })
map("n", "<leader>fw", telescope.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Search open buffers" })

-- Move lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down one line" }) -- m for move, > for visual selection, +1 to move it, gv to select again, = to update indentation, gv again
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up one line" })

-- Common commands
map("n", "<leader>x", "<cmd>!chmod +x %", { desc = "Add the executable flag to the current file" })
