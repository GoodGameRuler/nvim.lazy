return {
    'Everblush/nvim', 
    priority = 1000, --first plugin load
    name = 'everblush',
    config = function()
        vim.cmd([[colorscheme everblush]])
    end,
}
