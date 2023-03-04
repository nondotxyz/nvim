local spec = {
	{ "jesseleite/nvim-noirbuddy", dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" } },
	{ "RRethy/nvim-base16" }
}

for _, plugin in ipairs(spec) do
	plugin["config"] = function()
		--[[ require("noirbuddy").setup({
			colors = {
				primary = "#a9ff70",
				secondary = "#71aa4b",
				diagnostic_error = "#EC0034",
				diagnostic_warning = "#ff7700",
				diagnostic_info = "#d5d5d5",
				diagnostic_hint = "#f5f5f5",
				diff_add = "#f5f5f5",
				diff_change = "#737373",
				diff_delete = "#EC0034",
			},
		}) ]]
		vim.cmd [[colorscheme base16-tomorrow-night]]
	end
end

return spec
