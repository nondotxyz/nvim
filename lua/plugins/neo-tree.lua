local spec = {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
	},
}

spec.config = function()
	require('neo-tree').setup {
		close_if_last_window = true,
	}

	vim.keymap.set('n', '<leader>fe', function()
		vim.cmd [[Neotree toggle]]
	end, { desc = '[F]ocus [E]xplorer' })
end
return spec
