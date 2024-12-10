vim.g.mapleader = " "
-- set shorter name for keymap function
local kmap = vim.keymap.set

-- set clipboard
vim.o.clipboard = unamedplus

-- Panes
kmap("n", "<Tab>h", "<C-w>h")
kmap("n", "<Tab>j", "<C-w>j")
kmap("n", "<Tab>k", "<C-w>k")
kmap("n", "<Tab>l", "<C-w>l")

-- Lets you move text in visual mode
kmap("v", "J", ":m '>+1<CR>gv=gv")
kmap("v", "K", ":m '<-2<CR>gv=gv")

-- Half Page Junping keeps cursor in the middle
kmap("n", "<C-d>", "<C-d>zz")
kmap("n", "<C-u>", "<C-u>zz")

-- Keeps search terms in the middle of the screen "/ or ?"
-- zv accounts for code folds
kmap("n", "n", "nzzzv")
kmap("n", "N", "Nzzzv")

-- greatest remap ever
kmap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
kmap({ "n", "v" }, "<leader>y", [["+y]])
kmap("n", "<leader>Y", [["+Y]])

kmap({ "n", "v" }, "<leader>d", [["_d]])

-- Select and replace
kmap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
kmap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Marks
kmap("n", "<leader><leader>", "`")
-- kmap("n", "<leader>M", "m")
