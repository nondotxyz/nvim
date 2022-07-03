local function set_keymaps(keymaps_obj_list)
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

set_keymaps {
	{"n",{
		{"<C-h>", "<C-w>h"},
		{"<C-j>", "<C-w>j"},
		{"<C-k>", "<C-w>k"},
		{"<C-l>", "<C-w>l"},

		{"<C-Up>", ":resize -2<CR>"},
		{"<C-Down", ":resize +2<CR>"},
		{"<C-Left>", ":vertical resize -2<CR>"},
		{"<C-Right>", ":vertical resize +2<CR>"},

		{"b]", ":bnext<CR>"},
		{"b]", ":bprevious<CR>"},

		{"<A-j>", "<Esc>:m .+1<CR>==gi"},
		{"<A-k>", "<Esc>:m .-2<CR>==gi"}
	}, { noremap=true, silent=true }}
}
