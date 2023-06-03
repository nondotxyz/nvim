local spec = {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		{ 'nvim-tree/nvim-web-devicons', lazy = true },
		{ 'arkav/lualine-lsp-progress' },
	},
	event = { 'BufReadPre', 'BufNewFile' },
}

spec.config = function()
	local navic = require 'nvim-navic'

	require('lualine').setup {
		options = {
			component_separators = ' ',
			section_separators = { left = '', right = '' },
			disabled_filetypes = { 'neo-tree' },
		},
		sections = {
			lualine_a = {
				{ 'mode', separator = { left = '' }, right_padding = 2 },
			},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {
				'filetype',
				function()
					local msg = 'no lsp active'
					local active_lsp = vim.lsp.buf_get_clients()
					for _, lsp in ipairs(active_lsp) do
						if lsp.name ~= 'null-ls' then
							msg = lsp.name
							return msg
						end
					end
					return msg
				end,
				'progress',
			},
			lualine_z = {
				{ 'location', separator = { right = '' }, left_padding = 2 },
			},
		},
		winbar = {
			lualine_a = { 'filename', 'branch' },
			lualine_c = {
				{
					function()
						return navic.get_location()
					end,
				},
			},
		},
		tabline = {},
		extensions = {},
	}
end

return spec
