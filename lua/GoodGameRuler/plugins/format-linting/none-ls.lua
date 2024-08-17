return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,

				    -- null_ls.builtins.completion.spell,
                -- null_ls.builtins.code_actions.gitrebase,
                -- null_ls.builtins.code_actions.gitsigns,
                -- null_ls.builtins.code_actions.proselint,
                -- null_ls.builtins.code_actions.shellcheck,

                require("none-ls.diagnostics.cpplint"),
				require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
			},
		})
	end,
}
