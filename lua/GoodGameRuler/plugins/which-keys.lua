return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function ()
        -- vim.keymap.set("n", "<leader>ka", ":WhichKey<CR>");

        local wk = require("which-key")
        wk.register({
            k = {
                name = "Keymap Cheat Sheet", -- optional group name
                a = {":WhichKey<CR>", "All Keymaps"},
            },
        }, { prefix = "<leader>" })
    end
}
