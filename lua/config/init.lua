-- Vim globals
require("config.options")

-- Lazy package manager
require("config.lazy")

-- Use catppuccin as colorscheme
vim.cmd.colorscheme("catppuccin")

-- Keyboard shortcuts
require("config.keymap")

-- Auto commands
require("config.autocommands")
