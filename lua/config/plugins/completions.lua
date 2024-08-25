return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "saadparwaiz1/cmp_luasnip" },
			},
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
						col_offset = -3,
						side_padding = 0,
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind =
							require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"

						return kind
					end,
				},
				mapping = {
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),

					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					}),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				completion = {
					-- auto select first item
					completeopt = "menu,menuone,noinsert",
				},
				sources = cmp.config.sources({
					{
						name = "nvim_lsp",
						entry_filter = function(entry, _)
							local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
							if kind == "Text" then
								return false
							end
							return true
						end,
					},
					{ name = "luasnip" },
					{ name = "path" },
				}),
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup()

			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")

			local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
			autopairs.add_rules({
				-- Rule for a pair with left-side ' ' and right side ' '
				Rule(" ", " ")
					-- Pair will only occur if the conditional function returns true
					:with_pair(function(opts)
						-- We are checking if we are inserting a space in (), [], or {}
						local pair = opts.line:sub(opts.col - 1, opts.col)
						return vim.tbl_contains({
							brackets[1][1] .. brackets[1][2],
							brackets[2][1] .. brackets[2][2],
							brackets[3][1] .. brackets[3][2],
						}, pair)
					end)
					:with_move(cond.none())
					:with_cr(cond.none())
					-- We only want to delete the pair of spaces when the cursor is as such: ( | )
					:with_del(
						function(opts)
							local col = vim.api.nvim_win_get_cursor(0)[2]
							local context = opts.line:sub(col - 1, col + 2)
							return vim.tbl_contains({
								brackets[1][1] .. "  " .. brackets[1][2],
								brackets[2][1] .. "  " .. brackets[2][2],
								brackets[3][1] .. "  " .. brackets[3][2],
							}, context)
						end
					),
			})
			-- For each pair of brackets we will add another rule
			for _, bracket in pairs(brackets) do
				autopairs.add_rules({
					-- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
					Rule(bracket[1] .. " ", " " .. bracket[2])
						:with_pair(cond.none())
						:with_move(function(opts)
							return opts.char == bracket[2]
						end)
						:with_del(cond.none())
						:use_key(bracket[2])
						-- Removes the trailing whitespace that can occur without this
						:replace_map_cr(function(_)
							return "<C-c>2xi<CR><C-c>O"
						end),
				})
			end
		end,
	},
}
