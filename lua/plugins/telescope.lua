local spec = {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		keys = {
			{ '<leader>?',        desc = '[?] Find recently opened files' } ,
			{ '<leader><space>',  desc = ' [ ] Find existing buffers' } ,
			{ '<leader>/',        desc = '[/] Fuzzily search in current buffer' } ,
			{ '<leader>gf',       desc = 'Search [G]it [F]iles' } ,
			{ '<leader>sf',       desc = '[S]earch [F]iles' } ,
			{ '<leader>sh',       desc = '[S]earch [H]elp' } ,
			{ '<leader>sw',       desc = '[S]earch current [W]ord' } ,
			{ '<leader>sg',       desc = '[S]earch by [G]rep' } ,
			{ '<leader>sd',       desc = '[S]earch [D]iagnostics' } ,
		},
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
			vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
			vim.keymap.set('n', '<leader>/', function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end)

			vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files)
			vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files)
			vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
			vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string)
			vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep)
			vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics)
		end,
		lazy = true,
	},
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},
}

return spec
