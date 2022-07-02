local opt = vim.opt

opt.clipboard = "unnamedplus"

opt.shiftwidth = 4
opt.tabstop = 4

opt.wrap = false

opt.number = true
opt.relativenumber = true

opt.termguicolors = true

local function setcolorscheme(theme)
	local exists, _ = pcall(vim.cmd, "color " .. theme)
	if exists then
		if theme == "vscode" then vim.g.vscode_transparent = 1 end

		-- Sometimes theme needs their configuration first to be able to apply those configuration.
		-- fuck that xd just run the damn function again
		vim.cmd("color " .. theme)
	else
		return;
	end
end

setcolorscheme("vscode")
