local cp = require("nvim-tundra.palette.arctic")

require("nvim-tundra").setup({
	transparent_background = true,
	syntax = {
		booleans = { bold = true, italic = false },
		comments = { bold = false, italic = true },
		types = { italic = false },
	},
	plugins = {
		lsp = true,
		semantic_tokens = true,
		treesitter = true,
		telescope = true,
		nvimtree = true,
		cmp = true,
		context = true,
		dbui = true,
		gitsigns = true,
		neogit = true,
		textfsm = true,
	},
	overwrite = {
		highlights = {
			NormalFloat = { bg = "none" },
		},
	},
})
