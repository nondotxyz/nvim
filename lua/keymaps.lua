utils.set_keymaps {
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
		{"b[", ":bprevious<CR>"},

		{"<A-j>", "<Esc>:m .+1<CR>==gi"},
		{"<A-k>", "<Esc>:m .-2<CR>==gi"}
	}, { noremap=true, silent=true }}
}
