local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		numbers = "none",
		close_command = "bdelete %d",
		right_mouse_command = "bdelete %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			-- icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "none",
		},
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		get_element_icon = function(buf)
			return require("nvim-web-devicons").get_icon(buf.name, buf.extension, { default = true })
		end,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		separator_style = { "|", "|" },
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
	},
})
