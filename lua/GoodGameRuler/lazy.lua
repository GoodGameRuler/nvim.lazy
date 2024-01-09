local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy").setup({
    {import = "GoodGameRuler.plugins"},
    {import = "GoodGameRuler.plugins.lsp"},
    {import = "GoodGameRuler.plugins.themes"}
}, {
    install  = {
        colorscheme = {"everblush"},
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

vim.keymap.set("n", "<leader>lo", ":Lazy<CR>")
vim.keymap.set("n", "<leader>li", ":Lazy install<CR>")
vim.keymap.set("n", "<leader>ll", ":Lazy load all<CR>")
