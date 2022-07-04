utils.create_au("autoload", {
	{event = "BufWritePost", pattern = vim.fn.stdpath "config" .. "/**/*.lua", command = "source <afile>"},
	{event = "BufWritePost", pattern = vim.fn.stdpath "config" .. "/**/plugins.lua", command = "source <afile> | PackerSync"}
})

utils.create_au("RestoreCursorShapeOnExist", {
	{event = "VimLeave", command = "set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400"}
})

