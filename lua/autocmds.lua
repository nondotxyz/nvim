vim.cmd [[
	augroup autoload
		au!
		au BufWritePost $HOME/.config/nvim/**/*.lua source <afile>
		au BufWritePost $HOME/.config/nvim/**/plugins.lua source <afile> | PackerSync
	augroup end

	augroup RestoreCursorShapeOnExit
    	au!
    	au VimLeave * set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400
	augroup END
]]
