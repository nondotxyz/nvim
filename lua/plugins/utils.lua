return {
	{ 'folke/which-key.nvim',  opts = {} },
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		opts = {
			char = '┊',
			show_trailing_blankline_indent = false,
		},
	},
	{ 'numToStr/Comment.nvim', opts = {} },
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'tpope/vim-sleuth',
	{
		'stevearc/dressing.nvim',
		config = function()
			require('dressing').setup {}
		end,
	},
	--[[{
		'projekt0n/circles.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('circles').setup()
		end,
	},]]
	--
	{
		'lambdalisue/suda.vim',
		init = function()
			vim.cmd [[
			let g:suda_smart_edit = 1
			]]
		end,
	},
}
