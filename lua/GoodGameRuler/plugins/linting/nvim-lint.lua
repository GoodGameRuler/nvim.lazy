return {
    "https://github.com/mfussenegger/nvim-lint",
    event = "InsertEnter",
    config = function ()
        local lint = require("lint")

        lint.linters_by_ft = {
            markdown = {'vale',},
            javascript = {'eslint_d',},
            typescript = {'eslint_d',},
        }

        -- Keymaps
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end
}

