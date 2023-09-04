require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	transparent = true, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = false, bold = true },
		functions = { bold = true },
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "transparent",
		floats = "transparent",
	},
	sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = true, -- dims inactive windows
	lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a ColorScheme table
	---@param colors ColorScheme
	on_colors = function(colors)
		colors.blue1 = "#2ac3de"
		colors.green1 = "#73daca"
		colors.bg_dark = "#16161e"
		--       bg = "#24283b",
		-- bg_dark = "#1f2335",
		-- bg_float = "#1f2335",
		-- bg_highlight = "#292e42",
		-- bg_popup = "#1f2335",
		-- bg_search = "#3d59a1",
		-- bg_sidebar = "#1f2335",
		-- bg_statusline = "#1f2335",
		-- bg_visual = "#2e3c64",
		-- black = "#1d202f",
		-- blue =moon "#7aa2f7",
		-- blue0 = "#3d59a1",
		-- blue1 = "#2ac3de",
		-- blue2 = "#0db9d7",
		-- blue5 = "#89ddff",
		-- blue6 = "#b4f9f8",
		-- blue7 = "#394b70",
		-- border = "#1d202f",
		-- border_highlight = "#29a4bd",
		-- comment = "#565f89",
		-- cyan = "#7dcfff",
		-- dark3 = "#545c7e",
		-- dark5 = "#737aa2",
		-- delta = {
		--   add = "#316172",
		--   delete = "#763842"
		-- },
		-- diff = {
		--   add = "#283b4d",
		--   change = "#272d43",
		--   delete = "#3f2d3d",
		--   text = "#394b70"
		-- },
		-- error = "#db4b4b",
		-- fg = "#c0caf5",
		-- fg_dark = "#a9b1d6",
		-- fg_float = "#c0caf5",
		-- fg_gutter = "#3b4261",
		-- fg_sidebar = "#a9b1d6",
		-- git = {
		--   add = "#449dab",
		--   change = "#6183bb",
		--   delete = "#914c54",
		--   ignore = "#545c7e"
		-- },
		-- gitSigns = {
		--   add = "#266d6a",
		--   change = "#536c9e",
		--   delete = "#b2555b"
		-- },
		-- green = "#9ece6a",
		-- green1 = "#73daca",
		-- green2 = "#41a6b5",
		-- hint = "#1abc9c",
		-- info = "#0db9d7",
		-- magenta = "#bb9af7",
		-- magenta2 = "#ff007c",
		-- none = "NONE",
		-- orange = "#ff9e64",
		-- purple = "#9d7cd8",
		-- red = "#f7768e",
		-- red1 = "#db4b4b",
		-- teal = "#1abc9c",
		-- terminal_black = "#414868",
		-- warning = "#e0af68",
		-- yellow = "#e0af68"
	end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and ColorScheme table
	---@param highlights Highlights
	---@param colors ColorScheme
	on_highlights = function(hl, c)
		local prompt = "#2f3247"
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopePromptNormal = {
			bg = c.bg,
		}
		hl.TelescopePromptBorder = {
			bg = c.bg,
			fg = c.bg,
		}
		hl.TelescopePromptTitle = {
			bg = c.bg,
			fg = c.bg,
		}
		hl.TelescopePreviewTitle = {
			bg = c.orange,
			fg = c.bg_highlight,
		}
		hl.TelescopeResultsTitle = {
			bg = c.red,
			fg = c.bg_highlight,
		}
		hl.CursorLine = {
			bg = c.bg,
		}
		hl.DiagnosticVirtualTextError = { fg = c.error }
		hl.DiagnosticVirtualTextWarn = { fg = c.warning }
		hl.DiagnosticVirtualTextInfo = { fg = c.info }
		hl.DiagnosticVirtualTextHint = { fg = c.hint }
		hl.ColorColumn = { bg = c.bg }
		hl.MatchParen = { fg = c.orange, bg = c.bg_highlight, bold = true }
	end,
})
