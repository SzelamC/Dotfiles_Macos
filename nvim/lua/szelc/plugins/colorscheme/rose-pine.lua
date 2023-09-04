require("rose-pine").setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = "moon",
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,
	highlight_groups = {
		TelescopeNormal = {
			bg = "base",
			fg = "subtle",
		},
		TelescopeBorder = {
			bg = "base",
			fg = "base",
		},
		TelescopePromptNormal = {
			bg = "surface",
		},
		TelescopePromptBorder = {
			bg = "surface",
			fg = "surface",
		},
		TelescopePromptTitle = {
			bg = "iris",
			fg = "overlay",
		},
		TelescopePreviewTitle = {
			bg = "love",
			fg = "overlay",
		},
		TelescopeResultsTitle = {
			bg = "rose",
			fg = "overlay",
		},
	},
})

-- Set colorscheme after options
-- vim.cmd("colorscheme rose-pine")
