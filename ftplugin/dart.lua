local keymap = vim.keymap -- for conciseness

require("flutter-tools")

keymap.set("n", "<leader>frp", "<cmd>FlutterRun<cr>", { desc = "Run flutter" })
keymap.set("n", "<leader>fsd", "<cmd>FlutterDevices<cr>", { desc = "Run flutter" })
