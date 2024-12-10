return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-nvim-lua", -- source for file system paths
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim", -- vs-code like pictograms
			"uga-rosa/cmp-dictionary",
			"SergioRibera/cmp-dotenv", -- env variables
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = function()
			local cmp = require("cmp")

			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({

				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},

				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
				},

				-- sources for autocompletion
				sources = cmp.config.sources({
					{ name = "luasnip" }, -- snippets
					{ name = "neorg" },
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					-- { name = "fuzzy_buffer" },
					{ name = "buffer", keyword_length = 5 }, -- text within current buffer
					{
						name = "dotenv",
						option = {
							path = ".",
							load_shell = false,
						},
						keyword_length = 3,
					},
					{ name = "path" }, -- file system paths
					{ name = "dictionary", keyword_length = 5 },
				}),

				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				-- configure lspkind for vs-code like pictograms in completion menucmp
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
						with_text = true,
						menu = {
							buffer = "[BUF]",
							nvim_lsp = "[LSP]",
							nvim_lua = "[API]",
							path = "[PATH]",
							luasnip = "[SNIP]",
							dictionary = "[DICT]",
							dotenv = "[ENV]",
						},
					}),
				},
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		config = function()
			local ls = require("luasnip")

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })
		end,
	},
}
