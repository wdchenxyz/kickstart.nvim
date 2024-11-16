return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },

    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        luasnip.config.setup {}

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete {},
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            },
        }
    end
}
