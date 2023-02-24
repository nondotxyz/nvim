wk.register({
	["<C-Up>"] = { "<cmd>resize +2<cr>", "Increase window height" },
	["<C-Down>"] = { "<cmd>resize -2<cr>", "Decrease window height" },
	["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Decrease window width" },
	["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Increase window width" },
})
