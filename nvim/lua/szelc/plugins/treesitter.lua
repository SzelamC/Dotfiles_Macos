local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

vim.api.nvim_set_hl(0, "@rainbow.red", { fg = "#FD8A8A" })
vim.api.nvim_set_hl(0, "@rainbow.pink", { fg = "#F6C6EA" })
vim.api.nvim_set_hl(0, "@rainbow.yellow", { fg = "#F9F9C5" })
vim.api.nvim_set_hl(0, "@rainbow.orange", { fg = "#FAAB7B" })

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},

	context_commentstring = {
		enable = true,
	},
	-- auto install above language parsers
	auto_install = true,
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
-- vim.treesitter.language.register("tsx", "typescript.tsx")
-- vim.treesitter.language.register("typescriptreact", "javascript")
