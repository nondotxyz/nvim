local spec = {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'onsails/lspkind.nvim',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
	},
	event = 'InsertEnter',
}

spec.config = function()
	local cmp = require 'cmp'
	local lspkind = require 'lspkind'
	local luasnip = require 'luasnip'

	cmp.setup {
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
		window = {
			completion = {
				side_padding = 1,
				scrollbar = false,
			},
		},
		formatting = {
			fields = { 'kind', 'abbr', 'menu' },
			format = lspkind.cmp_format {
				mode = 'symbol_text',
				maxwidth = 50,
				preset = 'codicons',
				ellipsis_char = '...',
				before = function(_, vim_item)
					return vim_item
				end,
			},
		},
		mapping = {
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<CR>'] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.jump(1)
				else
					fallback()
				end
			end),
			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end),
		},
		sources = {
			{ name = 'nvim_lsp', priority = 8 },
			{ name = 'luasnip' },
			{ name = 'buffer' },
			{ name = 'path' },
		},
	}
end

return spec
