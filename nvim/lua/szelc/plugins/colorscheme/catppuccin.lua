local transparent_background = true
local clear = {}

require("catppuccin").setup({
	flavour = "macchiato", -- Can be one of: latte, frappe, macchiato, mocha
	background = { light = "latte", dark = "macchiato" },
	dim_inactive = {
		enabled = false,
		-- Dim inactive splits/windows/buffers.
		-- NOT recommended if you use old palette (a.k.a., mocha).
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = transparent_background,
	show_end_of_buffer = false, -- show the '~' characters after the end of buffers
	term_colors = true,
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	styles = {
		comments = { "italic" },
		functions = { "bold" },
		conditionals = { "bold" },
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		cmp = true,
		gitsigns = true,
		indent_blankline = { enabled = false, colored_indent_levels = false },
		markdown = true,
		mason = true,
		mini = true,
		nvimtree = true,
		semantic_tokens = true,
		telescope = {
			enable = false,
		},
		treesitter_context = true,
	},
	color_overrides = {},
	highlight_overrides = {
		---@param cp palette
		all = function(cp)
			return {
				-- For base configs
				CursorLineNr = { fg = cp.green },

				-- For nvim-tree
				NvimTreeRootFolder = { fg = cp.pink },

				-- Telescope
				TelescopeBorder = {
					fg = cp.mantle,
					bg = cp.mantle,
				},
				TelescopeMatching = { fg = cp.blue },
				TelescopeNormal = {
					bg = cp.mantle,
				},
				TelescopePromptBorder = {
					fg = cp.surface0,
					bg = cp.surface0,
				},
				TelescopePromptNormal = {
					fg = cp.text,
					bg = cp.surface0,
				},
				TelescopePromptPrefix = {
					fg = cp.flamingo,
					bg = cp.surface0,
				},
				TelescopePreviewTitle = {
					fg = cp.base,
					bg = cp.green,
				},
				TelescopePromptTitle = {
					fg = cp.base,
					bg = cp.red,
				},
				TelescopeResultsTitle = {
					fg = cp.mantle,
					bg = cp.lavender,
				},
				TelescopeSelection = {
					fg = cp.text,
					bg = cp.surface0,
					style = { "bold" },
				},
				TelescopeSelectionCaret = { fg = cp.flamingo },

				-- For treesitter
				["@keyword.return"] = { fg = cp.pink, style = clear },
				["@parameter"] = { style = clear },
				-- ["@lsp.mod.readonly"] = { fg = cp.peach },
			}
		end,
	},
})

vim.cmd([[colorscheme catppuccin]])
