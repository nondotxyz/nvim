local spec = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	}
}

spec.config = function()
	require("telescope").setup()

	wk.register({
		["<leader>tb"] = { require("telescope.builtin").buffers, "Open telescope builtins" }
	})
end

return spec
