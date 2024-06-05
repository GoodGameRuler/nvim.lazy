local keymap = vim.keymap -- for conciseness

require("flutter-tools")

keymap.set("n", "<leader>frp", "<cmd>FlutterRun<cr>", { desc = "Run flutter" })
keymap.set("n", "<leader>fsd", "<cmd>FlutterDevices<cr>", { desc = "Run flutter" })

vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
