local spec = {
	'stevearc/oil.nvim',
	opts = {},
	dependencies = { { 'nvim-tree/nvim-web-devicons', lazy = true } },
}

spec.config = function()
	require('oil').setup {
		view_option = {
			show_hidden = true,
		},
		float = {
			-- Padding around the floating window
			padding = 2,
			max_width = 0,
			max_height = 0,
			border = 'rounded',
			win_options = {
				winblend = 10,
			},
		},
	}

	vim.keymap.set('n', '-', require('oil').open_float, { desc = 'Open parent directory' })
end
return spec
