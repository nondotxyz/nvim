local spec = {
	"folke/which-key.nvim",
	init = function()
		wk = require("which-key")
	end,
	priority = 90,
	config = true,
}

spec.config = true


return spec
