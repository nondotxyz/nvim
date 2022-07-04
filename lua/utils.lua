_G.debug.inspect = function (...)
	print(vim.inspect(...))
end

_G.utils = {}

_G.utils.set_keymaps = function(keymaps_obj_list)
	for _, keymaps_obj in pairs(keymaps_obj_list) do
		local mode = keymaps_obj[1]
		local opts = keymaps_obj[3] or nil
		for _, keymaps in pairs(keymaps_obj[2]) do
			if keymaps[3] and opts then
				opts = keymaps[3]
			elseif not keymaps[3] and not opts then
				error("No options provided.")
			end

			vim.keymap.set(mode, keymaps[1], keymaps[2], opts)
		end
	end
end

_G.utils.create_au = function (group, opts)
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
