return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
        "nvim-tree/nvim-web-devicons",
        "https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
        "https://github.com/aaronhallaert/advanced-git-search.nvim",
        "https://github.com/AckslD/nvim-neoclip.lua",
        "https://github.com/nvim-telescope/telescope-ui-select.nvim",
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
        })

        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")


        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fa", "<cmd>Telescope live_grep_args<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fh", "<cmd>AdvancedGitSearch<cr>", { desc = "Find string under cursor in cwd" })
    end,
}
