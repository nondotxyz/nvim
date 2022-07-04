local status, packer = pcall(require, "packer")

if not status then
	local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
	packer_bootstrap = vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }

	vim.cmd [[packadd packer.nvim]]
	status, packer = pcall(require, "packer")

	if status then
		print "Packer was installed! \n"
	else
		error "Packer was not installed. :<"
	end
end

packer.startup {
	function(use)
		use "wbthomason/packer.nvim"
		use "nvim-lua/plenary.nvim"
		use "rafcamlet/nvim-luapad"

		-- [Themes]
		use "shaeinst/roshnivim-cs"
		use "Mofiqul/vscode.nvim"

		-- [LSP]
		use "neovim/nvim-lspconfig"
		use "onsails/lspkind.nvim"
		use "williamboman/nvim-lsp-installer"

		-- [CMP]
		use "hrsh7th/nvim-cmp"
		use "hrsh7th/cmp-nvim-lsp"
		use "hrsh7th/cmp-path"
		use "hrsh7th/cmp-buffer"
		use "hrsh7th/cmp-nvim-lua"

		-- [Treesitter]
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate"
		}

		-- [Snippet Engine]
		use "L3MON4D3/LuaSnip"

		-- [Schema Store]
		use "b0o/SchemaStore.nvim"

		-- [Statusline]
		use "nvim-lualine/lualine.nvim"

		-- [Bufferline]
		use "akinsho/bufferline.nvim"

		use "kyazdani42/nvim-web-devicons"

		-- [Markdown]
		use { "ellisonleao/glow.nvim", branch = "main" }
		use "davidgranstrom/nvim-markdown-preview"

		if packer_bootstrap then
			packer.sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float { border = "single" }
			end
		}
	}
}
