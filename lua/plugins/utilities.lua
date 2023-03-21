return {
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
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end
	},
	{
		"karb94/neoscroll.nvim",
		config = true
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	{
		"matbme/JABS.nvim",
		config = function()
			require 'jabs'.setup {}
		end
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup {}
		end
	}
}
