return {
    "kdheepak/lazygit.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim", },
    config = function ()
        -- set keymaps
        require("lazygit")
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Git managment" })
    end,
}

