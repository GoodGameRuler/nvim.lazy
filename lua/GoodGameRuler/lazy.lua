local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
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
  -- { import = "GoodGameRuler.plugins" },
  { import = "GoodGameRuler.plugins.autocomplete" },
  { import = "GoodGameRuler.plugins.file_management" },
  { import = "GoodGameRuler.plugins.notetaking" },
  { import = "GoodGameRuler.plugins.git" },
  { import = "GoodGameRuler.plugins.lsp" },
  { import = "GoodGameRuler.plugins.debugging" },
  { import = "GoodGameRuler.plugins.programming_utils" },
  { import = "GoodGameRuler.plugins.themes" },
  { import = "GoodGameRuler.plugins.ui" },
  { import = "GoodGameRuler.plugins.utils" },
  -- { import = "GoodGameRuler.plugins.format-linting" },
  { import = "GoodGameRuler.plugins.linting" },
  { import = "GoodGameRuler.plugins.formatting" },
}, {
  install = {
    colorscheme = { "catppuccin", "tokyo-night" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  {
    rocks = {
      enabled = true,
      hererocks = true,
    },
  },
})

vim.keymap.set("n", "<leader>lo", ":Lazy<CR>")
vim.keymap.set("n", "<leader>li", ":Lazy install<CR>")
vim.keymap.set("n", "<leader>ll", ":Lazy load all<CR>")
