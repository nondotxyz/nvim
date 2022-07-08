local lsp_installer = require "nvim-lsp-installer"
local lsp = require "lspconfig"

utils.set_keymaps {
	{"n", {
		{ "<Space>e", vim.diagnostic.open_float },
		{ "[d", vim.diagnostic.goto_prev },
		{ "]d", vim.diagnostic.goto_next },
	}, { noremap = true, silent = true }}
}




do
	local signs = {
	{ name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = ""})
	end

	vim.diagnostic.config {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
	}
end


local on_attach = function(client, bufnr)
	utils.set_keymaps {
		{"n", {
			{ "gD", vim.lsp.buf.declaration },
			{ "gd", vim.lsp.buf.definition },
			{ "gr", vim.lsp.buf.references },
			{ "ga", vim.lsp.buf.code_action },
			{ "K",  vim.lsp.buf.hover },
		}, { noremap = true, silent = true, buffer = bufnr }}
	}

  if client.server_capabilities.document_formatting or client.server_capabilities.document_range_formatting then
		utils.set_keymaps { {"n", {"<Space>ff", vim.lsp.buf.formatting}, { noremap = true, silent = true, buffer = bufnr }}}
	end
end

lsp_installer.setup {
	ensure_installed = {"sumneko_lua"}
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(lsp_installer.get_installed_servers()) do
	local opts = { on_attach = on_attach, capabilities = capabilities }
	local has_custom_opts, server_custom_opts = pcall(require, "config.lsp." .. server.name)

	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lsp[server.name].setup(opts)
end
