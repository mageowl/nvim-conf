-- 5.2 polyfill
if not table.unpack then
	---@diagnostic disable-next-line: deprecated
	table.unpack = unpack
end

-- Vim globals
require("config.options")

-- Lazy package manager
require("config.lazy")

-- Use catppuccin as colorscheme
require("config.color")("catppuccin-mocha")

-- Keyboard shortcuts
require("config.keymap")

-- Auto commands
require("config.auto_commands")

-- Editor commands
require("config.user_commands")

-- Custom highlighting
require("config.highlights")
