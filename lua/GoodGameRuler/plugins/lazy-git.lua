return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function ()
        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Git managment" })
    end,
}

