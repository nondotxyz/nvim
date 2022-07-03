local lsp_installer = require "nvim-lsp-installer"
local lsp = require "lspconfig"

local opts = { noremap = true, silent = true}
local function set_keymaps(key, func) vim.keymap.set('n', key, func, opts) end
set_keymaps("<space>e", vim.diagnostic.open_float)
set_keymaps("[d", vim.diagnostic.goto_prev)
set_keymaps("]d", vim.diagnostic.goto_next)

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
	opts = { noremap = true, silent = true, buffer = bufnr }
	local function buf_set_keymaps(key, func) vim.keymap.set('n', key, func, opts) end
	local keymaps = {
		{ "gD", vim.lsp.buf.declaration },
		{ "gd", vim.lsp.buf.definition },
		{ "gr", vim.lsp.buf.references },
		{ "ga", vim.lsp.buf.code_action },
		{ "K",  vim.lsp.buf.hover },
	}
	for _, keys in ipairs(keymaps) do
		buf_set_keymaps(keys[1], keys[2])
	end

  if client.server_capabilities.document_formatting or client.server_capabilities.document_range_formatting then
		buf_set_keymaps("<space>ff", vim.lsp.buf.formatting)
	end
end

lsp_installer.setup {
	ensure_installed = {"sumneko_lua"}
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(lsp_installer.get_installed_servers()) do
	opts = { on_attach = on_attach, capabilities = capabilities }
	local has_custom_opts, server_custom_opts = pcall(require, "config.lsp." .. server.name)

	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lsp[server.name].setup(opts)
end
