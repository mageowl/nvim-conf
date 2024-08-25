vim.g.mapleader = " "

-- Neovide
vim.g.neovide_padding_top = 20
vim.g.neovide_padding_bottom = 20

-- Numbers
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Tab size
vim.o.expandtab = false
vim.o.tabstop = 4 -- display size
vim.o.shiftwidth = 4 -- length using > and < in visual mode

-- Hide tildes at end of file
vim.opt.fillchars = { eob = " " }

-- Use undo tree instead of swap files
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.o.undofile = true

-- Keep 8 lines visible on both sides at all times
vim.o.scrolloff = 8

-- Disable mouse
vim.o.mouse = ""

-- Hide '-- INSERT --' because lualine shows it
vim.o.showmode = false
vim.o.showcmd = false
