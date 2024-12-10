require("GoodGameRuler.core")
require("GoodGameRuler.functions")

if vim.g.vscode then
	-- VSCode extension
else
	require("GoodGameRuler.lazy")
	-- ordinary Neovim
end

vim.cmd([[
  hi NormalNC ctermbg=NONE guibg=NONE
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
