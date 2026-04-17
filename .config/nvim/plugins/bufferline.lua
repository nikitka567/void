require("bufferline").setup({
	options = {
		indicator = {
			icon = '',
			style = 'icon',
		},
		enforce_regular_tabs = true,
		show_buffer_close_icons = false,
		tab_size = 20,
		modified_icon = '*',
		left_trunc_marker = '<',
    right_trunc_marker = '>',
		separator_style = 'thin',
		offsets = {
			{
				filetype = 'NvimTree',
				text = '^w^',
				highlight = 'Directory',
				separator = false,
			},
    },
	},
})
