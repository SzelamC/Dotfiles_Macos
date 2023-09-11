local palette = require("nordic.colors")

-- local palette = {
--
--     none = 'NONE',
--
--     -- Blacks. Not in base Nord.
--     black0 = '#191D24',
--     black1 = '#1E222A',
--     -- Slightly darker than bg.  Very useful for certain popups
--     black2 = '#222630',
--
--     -- Grays
--     -- This color is used on their website's dark theme.
--     gray0 = '#242933', -- bg
--     -- Polar Night.
--     gray1 = '#2E3440',
--     gray2 = '#3B4252',
--     gray3 = '#434C5E',
--     gray4 = '#4C566A',
--
--     -- A light blue/gray.
--     -- From @nightfox.nvim.
--     gray5 = '#60728A',
--
--     -- Dim white.
--     white0 = '#BBC3D4',
--
--     -- Snow storm.
--     white1 = '#D8DEE9',
--     white2 = '#E5E9F0',
--     white3 = '#ECEFF4',
--
--     -- Frost.
--     blue0 = '#5E81AC',
--     blue1 = '#81A1C1',
--     blue2 = '#88C0D0',
--
--     cyan = {
--         base = '#8FBCBB',
--         bright = '#9FC6C5',
--         dim = '#80B3B2',
--     },
--
--     -- Aurora.
--     -- These colors are used a lot, so we need variations for them.
--     -- Base colors are from original Nord palette.
--     red = {
--         base = '#BF616A',
--         bright = '#C5727A',
--         dim = '#B74E58',
--     },
--     orange = {
--         base = '#D08770',
--         bright = '#D79784',
--         dim = '#CB775D',
--     },
--     yellow = {
--         base = '#EBCB8B',
--         bright = '#EFD49F',
--         dim = '#E7C173',
--     },
--     green = {
--         base = '#A3BE8C',
--         bright = '#B1C89D',
--         dim = '#97B67C',
--     },
--     magenta = {
--         base = '#B48EAD',
--         bright = '#BE9DB8',
--         dim = '#A97EA1',
--     },
-- }

require("nordic").setup({
	-- This callback can be used to override the colors used in the palette.
	on_palette = function(palette)
		return palette
	end,
	-- Enable bold keywords.
	bold_keywords = true,
	-- Enable italic comments.
	italic_comments = true,
	-- Enable general editor background transparency.
	transparent_bg = true,
	-- Enable brighter float border.
	bright_border = false,
	-- Reduce the overall amount of blue in the theme (diverges from base Nord).
	reduced_blue = false,
	-- Swap the dark background with the normal one.
	swap_backgrounds = true,
	-- Override the styling of any highlight group.
	cursorline = {
		-- Bold cursorline number.
		bold_number = false,
		-- Avialable styles: 'dark', 'light'.
		theme = "light",
		-- Blending the cursorline bg with the buffer bg.
		blend = 1,
	},
	override = {
		BufferlineBackground = { bg = "none" },
		TelescopePromptBorder = { bg = palette.black2, fg = palette.black2 },
		TelescopeResultsBorder = { bg = palette.black1, fg = palette.black1 },
		TelescopePreviewBorder = { bg = palette.black1, fg = palette.black1 },
		MatchParen = { fg = palette.orange.dim },
		NvimTreeGitDirty = { fg = palette.yellow.bright },
		NvimTreeGitNew = { fg = palette.yellow.bright },
		NvimTreeGitDeleted = { fg = palette.yellow.bright },
		NvimTreeGitStaged = { fg = palette.yellow.bright },
		DiagnosticVirtualTextError = { bg = "none", fg = palette.error, bold = true }, -- Used for "Error" diagnostic virtual text
		DiagnosticVirtualTextWarn = { bg = "none", fg = palette.warning }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextWarning = { bg = "none", fg = palette.warning }, -- Used for "Warning" diagnostic virtual text
		DiagnosticVirtualTextInfo = { bg = "none", fg = palette.info }, -- Used for "Information" diagnostic virtual text
		DiagnosticVirtualTextHint = { bg = "none", fg = palette.hint }, -- Used for "Hint" diagnostic virtual text
		DiagnosticUnnecessary = { italic = false, fg = palette.gray4 },
		["@parameter"] = { italic = false },
		Visual = { bg = palette.gray2 },
		FloatBorder = { bg = "none", fg = "none" },
		NormalFloat = { bg = "none" },
		-- CursorLine = { bg = palette.black2 },
	},
})
