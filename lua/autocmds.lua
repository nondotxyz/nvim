local function create_au(group, opts)
	local create_group_id, group_id =  pcall(vim.api.nvim_create_augroup, group, { clear = true })
	if not create_group_id then
		group_id = nil
	end

	for _, au in pairs(opts) do
		vim.api.nvim_create_autocmd(au.event, {
			group = group_id,
			pattern = au.pattern,
			desc = au.desc,
			callback = au.callback,
			command = au.command,
		})

	end
end

create_au("autoload", {
	{event = "BufWritePost", pattern = vim.fn.stdpath "config" .. "/**/*.lua", command = "source <afile>"},
	{event = "BufWritePost", pattern = vim.fn.stdpath "config" .. "/**/plugins.lua", command = "source <afile> | PackerSync"}
})

create_au("RestoreCursorShapeOnExist", {
	{event = "VimLeave", command = "set guicursor=a:hor20-blinkwait400-blinkoff400-blinkon400"}
})

