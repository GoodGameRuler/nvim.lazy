o = vim.opt

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 8
vim.g.mapleader = " "

vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
-- vim.cmd(
-- [[
--   au BufWinLeave * silent mkview
--   au BufWinEnter * silent loadview
--   ]]
-- )

-- Error bars don't keep moving when not there
vim.o.signcolumn = "yes:2"

-- Spell Check
vim.opt.spelllang = "en_au"
vim.opt.spell = false
