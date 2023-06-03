local spec = {
	{
		'jesseleite/nvim-noirbuddy',
		dependencies = { 'tjdevries/colorbuddy.nvim', branch = 'dev' },
	},
	{ 'RRethy/nvim-base16' },
	{
		'catppuccin/nvim',
		name = 'catppuccin',
	},
	{
		'wuelnerdotexe/vim-enfocado',
		name = 'enfocado',
	},
}

local selected_theme = 'enfocado'
local config_table = {
	['nvim-noirbuddy'] = function()
		require('noirbuddy').setup {
			colors = {
				primary = '#a9ff70',
				secondary = '#71aa4b',
				diagnostic_error = '#EC0034',
				diagnostic_warning = '#ff7700',
				diagnostic_info = '#d5d5d5',
				diagnostic_hint = '#f5f5f5',
				diff_add = '#f5f5f5',
				diff_change = '#737373',
				diff_delete = '#EC0034',
			},
		}
	end,
	['nvim-base16'] = function()
		vim.cmd.colorscheme 'base16-tomorrow-night'
	end,
	['catppuccin'] = function()
		require('catppuccin').setup {}
		vim.cmd.colorscheme 'catppuccin'
	end,
	['enfocado'] = function()
		vim.cmd.colorscheme 'enfocado'
	end,
}

for _, plugin in ipairs(spec) do
	local theme, slash_pos
	if plugin.name then
		theme = plugin.name
	else
		slash_pos = string.find(plugin[1], '/')
		theme = string.sub(plugin[1], slash_pos + 1)
	end

	if theme == selected_theme then
		plugin['config'] = config_table[theme]
	end
end
return spec
