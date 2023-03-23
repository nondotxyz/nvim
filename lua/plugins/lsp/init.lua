local spec = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		{ "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
		{ "hrsh7th/cmp-nvim-lsp" },
		{
			"j-hui/fidget.nvim",
			config = true
		},
		{ "b0o/schemastore.nvim" },
	},
}

local function diagnostic_setup()
	wk.register({
		["<leader>e"] = { vim.diagnostic.open_float, "Open floating diagonstic window" },
		["[d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
		["]d"] = { vim.diagnostic.goto_next, "Go to next diagnostic" },
	})

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn",  text = "" },
		{ name = "DiagnosticSignHint",  text = "" },
		{ name = "DiagnosticSignInfo",  text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	vim.diagnostic.config({
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
	})
end

spec.config = function()
	local mason = require("mason")
	local mason_lsp = require("mason-lspconfig")
	local null_ls = require("null-ls")
	local lsp = require("lspconfig")
	mason.setup()
	mason_lsp.setup()

	diagnostic_setup()
	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.prettier,
		},
	})

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local on_attach = function(client, bufnr)
		local api = vim.lsp.buf
		wk.register({
			g = {
				D = { api.declaration, "Peek at declration" },
				d = { api.defintion, "Peek at definition" },
				i = { api.implementation, "Peek at implementation" },
				r = { api.references, "Peek at refernces" },
				td = { api.type_definition, "Peek at type defintion" },
			},
			["<leader>"] = {
				wa = { api.add_workspace_folder, "Add workspace folder" },
				wr = { api.remove_workspace_folder, "Remove workspace folder" },
				wl = {
					function()
						print(vim.inspect(api.list_workspace_folder()))
					end,
					"List all workspace folder",
				},
				rn = { api.rename, "Rename" },
				ca = { api.code_action, "Perform code actions" },
			},
			["K"] = { api.hover, "Simulate hover" },
			['<leader>f'] = { function() vim.lsp.buf.format { async = true } end, "Format code (forced)" }
		}, { buffer = bufnr })

		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end

		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end
	end

	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	for _, server in ipairs(mason_lsp.get_installed_servers()) do
		local opts = { on_attach = on_attach, capabilities = capabilities }
		local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp." .. server)
		if has_custom_opts then
			opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
		end
		lsp[server].setup(opts)
	end
end

return spec
