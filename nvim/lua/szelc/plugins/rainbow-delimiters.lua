local rainbow_delimiters = require("rainbow-delimiters")

vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		vim = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
}
vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#FD8A8A" })
vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#F6C6EA" })
vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#F9F9C5" })
vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#FAAB7B" })
