return {
	"gelguy/wilder.nvim",
	dependencies = {
		"roxma/nvim-yarp",
		"romgrk/fzy-lua-native",
	},
	build = ":UpdateRemotePlugins",
	event = "CmdlineEnter",
	config = function()
		local wilder = require("wilder")

		vim.cmd([[
            cmap <expr> <C-j> wilder#in_context() ? wilder#next() : "\<C-j>"
            cmap <expr> <C-k> wilder#in_context() ? wilder#previous() : "\<C-k>"
            cmap <expr> <C-n> wilder#in_context() ? wilder#next() : "\<C-n>"
            cmap <expr> <C-p> wilder#in_context() ? wilder#previous() : "\<C-p>"
        ]])

		wilder.setup({ modes = { ":", "/", "?" } })

		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.python_file_finder_pipeline({
					-- to use ripgrep : {'rg', '--files'}
					-- to use fd      : {'fd', '-tf'}
					file_command = { "find", ".", "-type", "f", "-printf", "%P\n" },
					-- to use fd      : {'fd', '-td'}
					dir_command = { "find", ".", "-type", "d", "-printf", "%P\n" },
					-- use {'cpsm_filter'} for performance, requires cpsm vim plugin
					-- found at https://github.com/nixprime/cpsm
					filters = { "fuzzy_filter", "difflib_sorter" },
				}),
				wilder.cmdline_pipeline(),
				wilder.python_search_pipeline()
			),
		})

		wilder.set_option(
			"renderer",
			wilder.popupmenu_renderer({
				-- highlighter applies highlighting to the candidates
				highlighter = {
					-- wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
					wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
					-- at https://github.com/romgrk/fzy-lua-native
				},
				highlights = {
					border = "Normal", -- highlight to use for the border
					accent = wilder.make_hl(
						"WilderAccent",
						"Pmenu",
						{ { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
					),
				},

				left = { " ", wilder.popupmenu_devicons() },
				right = { " ", wilder.popupmenu_scrollbar() },
				pumblend = 20,
				border = "rounded",
			})
		)
	end,
}
