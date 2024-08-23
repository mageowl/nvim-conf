return {
	with_palette = function(colors)
		return {
			CursorLine = { bg = colors.base },

			Type = { italic = true },
			Macro = { link = "Function" },
			-- builtin functions in rust
			["@lsp.typemod.function.defaultLibrary"] = { link = "@function" },
			["@lsp.typemod.method.defaultLibrary"] = { link = "@function" },
			["@lsp.typemod.macro.defaultLibrary"] = { link = "@function" },
			-- Enums
			["@lsp.type.enumMember"] = { fg = colors.teal },

			-- Telescope
			TelescopeTitle = { fg = colors.green },
			TelescopeBorder = { fg = colors.surface1 },
		}
	end
}
