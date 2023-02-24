local spec = {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	}
}

spec.config = function()
	-- Unless you are still migrating, remove the deprecated commands from v1.x

	require("neo-tree").setup {
		close_if_last_window = true,
	}
	wk.register {
		["<leader>tt"] = { "<cmd>NeoTreeFocusToggle<cr>", "Focus and Toggle NeoTree" }
	}
end
return spec
