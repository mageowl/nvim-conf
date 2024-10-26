local colors = vim.g.colors or {}

local highlights = {
	CursorLine = { bg = colors.mantle },

	Type = { italic = true, fg = colors.yellow },
	Macro = { link = "Function" },
	Error = {},

	-- builtin functions in rust
	["@lsp.typemod.function.defaultLibrary"] = { link = "@function" },
	["@lsp.typemod.method.defaultLibrary"] = { link = "@function" },
	["@lsp.typemod.macro.defaultLibrary"] = { link = "@function" },
	-- Enums
	["@lsp.type.enumMember"] = { fg = colors.teal },

	-- Floating windows
	FloatTitle = { fg = colors.green },
	FloatBorder = { fg = colors.surface1 },
	NormalFloat = { bg = colors.base },
	TelescopeBorder = { link = "FloatBorder" },
	TelescopeTitle = { link = "FloatTitle" },

	-- IndentBlankline scope
	["@ibl.scope.underline.1"] = { sp = colors.surface1, underline = true },
	["@ibl.scope.char.1"] = { fg = colors.surface1 },
}

for name, hl in pairs(highlights) do
	vim.api.nvim_set_hl(0, name, hl)
end

-- Completion menu highlights
local completion_menu_kinds = {
	"Enum",
	"File",
	"Text",
	"Unit",
	"Class",
	"Color",
	"Event",
	"Field",
	"Value",
	"Folder",
	"Method",
	"Module",
	"Struct",
	"Copilot",
	"Default",
	"Keyword",
	"Snippet",
	"Constant",
	"Function",
	"Operator",
	"Property",
	"Variable",
	"Interface",
	"Reference",
	"EnumMember",
	"Constructor",
	"TypeParameter",
}

for _, kind in ipairs(completion_menu_kinds) do
	local hl = "CmpItemKind" .. kind
	local current = vim.api.nvim_get_hl(0, { name = hl })
	vim.api.nvim_set_hl(0, hl, vim.tbl_extend("force", current, { reverse = true, bold = true }))
end
