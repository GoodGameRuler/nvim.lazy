require("GoodGameRuler.core")
require("GoodGameRuler.functions")

if vim.g.vscode then
	-- VSCode extension
else
	require("GoodGameRuler.lazy")
	-- ordinary Neovim
end
