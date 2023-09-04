local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.no_italic,
		close_command = "bdelete %d",
		right_mouse_command = "bdelete %d",
		left_mouse_command = "buffer %d",
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
		separator_style = { "", "" },
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
		-- highlights = {
		--
		-- 	buffer_selected = { italic = false },
		-- 	diagnostic_selected = { italic = false },
		-- 	hint_selected = { italic = false },
		-- 	pick_selected = { italic = false },
		-- 	pick_visible = { italic = false },
		-- 	pick = { italic = false },
		-- },
	},
})
