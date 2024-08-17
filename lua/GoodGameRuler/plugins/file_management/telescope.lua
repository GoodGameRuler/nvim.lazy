return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"aaronhallaert/advanced-git-search.nvim",
		"AckslD/nvim-neoclip.lua",
		"nvim-telescope/telescope-ui-select.nvim",
		"jonarrien/telescope-cmdline.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		require("telescope").load_extension("advanced_git_search")
		require("telescope").load_extension("neoclip")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				cmdline = {
					picker = {
						layout_config = {
							width = 120,
							height = 25,
						},
					},
					mappings = {
						complete = "<Tab>",
						run_selection = "<C-CR>",
						run_input = "<CR>",
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("notify")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", { desc = "Telescope colorscheme picker" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fa", "<cmd>Telescope live_grep_args<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fh", "<cmd>AdvancedGitSearch<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>sf", "<cmd>Telescope spell_suggestcr>", { desc = "Find string under cursor in cwd" })
		-- keymap.set("n", ":", ":Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
	end,
}
