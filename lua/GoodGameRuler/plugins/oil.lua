return {
    "stevearc/oil.nvim",
    -- opts = {}, -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        
        local oil = require("oil")

        local keymap = vim.keymap
        keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

    end
}
