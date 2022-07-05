local lualine = require "lualine"

lualine.setup {
	options = {
		theme = "iceberg_dark",
		section_separators = { left = "", right = "" },
		component_separators = "|"
	},
	sections = {
		lualine_a = {"mode", "branch"},
		lualine_b = {"filename"},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {"filetype", {function()
			local msg = "None"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local client = vim.lsp.get_active_clients()
			if next(client) == nil then
				return msg
			end
			for _, client in ipairs(client) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return client.name
				end
			end
		end,
		icon = "力"}},
		lualine_z = {"location"}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	}
}
