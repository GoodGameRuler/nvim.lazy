return {
	"nvim-neorg/neorg",
	dependencies = {
		"vhyrro/luarocks.nvim",
		-- "nvim-neorg/lua-utils.nvim",
		-- "pysan3/pathlib.nvim",
	},

	lazy = false,
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Load all the default modules
				["core.concealer"] = { config = { icon_preset = "diamond" } }, -- Allows for use of icons
				["core.dirman"] = { -- Manage your directories with Neorg
					config = {
						workspaces = {
							notes = "~/Norg",
							-- obsidian = "~/Obsidian",
						},
						default_workspace = "notes",
					},
				},
				["core.completion"] = { config = { engine = "nvim-cmp" } },
				["core.pivot"] = {},
				["core.itero"] = {},
				["core.journal"] = { config = { strategy = "flat" } },
			}, -- Your Neorg configuration
		})
	end,
}
