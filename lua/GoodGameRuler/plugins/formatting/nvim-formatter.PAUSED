return {
	"https://github.com/mhartington/formatter.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local util = require("formatter.util")
		local formatter = require("formatter")

		formatter.setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,

					-- You can also define your own configuration
					function()
						-- Supports conditional formatting
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						-- Full specification of configurations is down below and in Vim help
						-- files
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},

				rust = {},
				javascript = {
					function(parser)
						if not parser then
							return {
								exe = "prettier",
								args = {
									"--tab-width",
									"4",
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
								},
								stdin = true,
								try_node_modules = true,
							}
						end

						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--parser",
								parser,
							},
							stdin = true,
							try_node_modules = true,
						}
					end,
				},
				javascriptreact = {
					function(parser)
						if not parser then
							return {
								exe = "prettier",
								args = {
									"--tab-width",
									"4",
									"--stdin-filepath",
									util.escape_path(util.get_current_buffer_file_path()),
								},
								stdin = true,
								try_node_modules = true,
							}
						end

						return {
							exe = "prettier",
							args = {
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--parser",
								parser,
							},
							stdin = true,
							try_node_modules = true,
						}
					end,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})

		local keymap = vim.keymap
		keymap.set("n", "<leader>fm", "<cmd>Format<cr>", { desc = "Format" })
		keymap.set("n", "<leader>fw", "<cmd>FormatWrite<cr>", { desc = "Format Write" })

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end,
}
