return {
	"stevearc/quicker.nvim",
	event = "FileType qf",
	---@module "quicker"
	config = function()
		require("quicker").setup()
	end,
}
