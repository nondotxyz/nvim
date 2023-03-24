---@type LazySpec
return {
	'goolord/alpha-nvim',
	dependencies = { {
		"Shatur/neovim-session-manager",
		opts = function()
			local Path = require('plenary.path')
			return {
				session_dir = Path:new(vim.fn.stdpath("data"), 'sessions'),
				autoload_mode = "Disable"
			}
		end
	} },
	config = function()
		require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
	end
}
