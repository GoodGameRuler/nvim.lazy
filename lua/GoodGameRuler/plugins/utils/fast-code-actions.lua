return {
	"Chaitanyabsprip/fastaction.nvim",
	---@type FastActionConfig
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>ca", '<cmd>lua require("fastaction").code_action()<CR>', { buffer = bufnr })
		vim.keymap.set(
			"v",
			"<leader>ca",
			"<esc><cmd>lua require('fastaction').range_code_action()<CR>",
			{ buffer = bufnr }
		)
	end,
}
