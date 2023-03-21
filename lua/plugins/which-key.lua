local spec = {
	"folke/which-key.nvim",
	init = function()
		wk = require("which-key")
	end,
	lazy = false,
	priority = 90,
	config = true,
}

spec.config = function()
end

return spec
