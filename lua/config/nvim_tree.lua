require("nvim-tree").setup()

utils.set_keymaps {
	{"n", {
		{"<C-n>", ":NvimTreeToggle<CR>"}
	}, { noremap=true, silent=true}}
}
