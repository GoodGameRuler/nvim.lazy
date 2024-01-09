function ColorMyPencils(color)
    color = color or 'rose-pine'
    vim.cmd("colorscheme rose-pine")

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "zaldih/themery.nvim",
    event = "VeryLazy",
    config = function()
        require("themery").setup({
            -- themes = {"everblush", 'tokyonight', 'tokyonight-night'}, -- Your list of installed colorschemes
            -- themes = {'everblush', 'rose-pine', 'tokyonight', 'tokyonight-night'}, -- Your list of installed colorschemes
            themes = {
                { name = 'everblush', colorscheme = 'everblush', after = [[ ColorMyPencils() ]],},
                { name = 'rose-pine', colorscheme = 'rose-pine', after = [[ ColorMyPencils() ]],},
                { name = 'tokyonight', colorscheme = 'tokyonight', after = [[ ColorMyPencils() ]],},
                { name = 'tokyonight-night', colorscheme = 'tokyonight-night', after = [[ ColorMyPencils() ]],},
            }, -- Your list of installed colorschemes
            themeConfigFile = "~/.config/nvim/lua/GoodGameRuler/plugins/colorscheme.lua", -- Described below
            livePreview = true, -- Apply theme while browsing. Default to true.
        })

        -- Themery block
-- This block will be replaced by Themery.
vim.cmd("colorscheme tokyonight-night")

ColorMyPencils()
vim.g.theme_id = 4
-- end themery block 


        local wk = require("which-key")
        wk.register({
            th = {":Themery<CR>", "Theme Switcher"},
        }, { prefix = "<leader>" })
    end
}

