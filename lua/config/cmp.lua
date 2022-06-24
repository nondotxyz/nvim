local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"

cmp.setup {
	snippet = {
		expand = function(args) 
			luasnip.lsp_expands(args.body)
		end
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			preset = "codicons",
			maxwidth = 50,

			before = function(entry, vim_item)
				vim_item.menu = ({
					buffer = "[Buffer]",
					path = "[Path]",
					nvim_lua = "[vim]"
				})[entry.source.name]
				return vim_item
			end
		})
	},
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = function(fallback)
			if cmp.visible() then
				cmp.close()
			else
				cmp.complete()
			end
		end,
		["<CR>"] = cmp.mapping.confirm { select = true }
	}),
	sources = {
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	confirm_opts = {
		select = true
	},
	experimental = {
		ghost_text = true
	}
}
