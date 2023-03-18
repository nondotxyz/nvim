local spec = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim"
	}
}

spec.config = function()
	require("telescope").setup(
		{
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					theme = "dropdown",
					previewer = false,
					mappings = {
						i = {
							["<c-d>"] = "delete_buffer",
						}
					}
				}
			}
		}
	)

	wk.register({
		["<leader>bb"] = { require("telescope.builtin").buffers, "Open telescope builtins" }
	})
end

return spec
