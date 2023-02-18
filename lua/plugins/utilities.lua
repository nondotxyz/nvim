return {
	{
		"folke/which-key.nvim",
		init = function()
			wk = require("which-key")
		end,
		lazy = false,
		priority = 90,
		config = true,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
			require("notify").setup {
				render = "compact",
				stages = "slide",
				level = 1
			}
			wk.register({
				["<space>cn"] = { require("notify").dismiss, "Dimiss notifcation" }
			})
		end
	},
	{
		"lambdalisue/suda.vim",
		init = function()
			vim.cmd [[
			let g:suda_smart_edit = 1
			]]
		end,
	},
	{
		"akinsho/toggleterm.nvim", config = function()
		require("toggleterm").setup()
	end
	}
}
