local spec = {
	"akinsho/bufferline.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons"
	},
	event = "FileType"
}

spec.config = {
	highlights = {
		buffer_selected = {
			bold = false,
			italic = false,
		}
	},
	options = {
		diagnostic = "nvim_lsp",
		diagnostic_update_in_insert = true,
		show_close_icon = false,
		show_buffer_close_icon = true,
		seperator = "thin",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true
			}
		},
	}
}

return spec
