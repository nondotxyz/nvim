local spec = {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		{ 'kyazdani42/nvim-web-devicons', lazy = true },
		{ 'arkav/lualine-lsp-progress' }
	}
}

spec.config = function()
	local noirbuddy_lualine = require('noirbuddy.plugins.lualine')

	require('lualine').setup {
		options = {
			theme = noirbuddy_lualine.theme,
			component_separators = ' ',
			section_separators = { left = '', right = '' },
			disabled_filetypes = { "neo-tree" },
		},
		sections = {
			lualine_a = {
				{ 'mode', separator = { left = '' }, right_padding = 2 },
			},
			lualine_b = { 'filename', 'branch' },
			lualine_c = {},
			lualine_x = {},
			lualine_y = { 'filetype', function()
				local msg = "no lsp active"
				local active_lsp = vim.lsp.buf_get_clients()
				for _, lsp in ipairs(active_lsp) do
					if lsp.name ~= "null-ls" then
						msg = lsp.name
						return msg
					end
				end
				return msg
			end, 'progress' },
			lualine_z = {
				{ 'location', separator = { right = '' }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	}
end

return spec
