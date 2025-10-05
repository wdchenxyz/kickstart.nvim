return {
    {
        'saghen/blink.cmp',
        enabled = true,
        dependencies = {
            'Kaiser-Yang/blink-cmp-avante',
            'rafamadriz/friendly-snippets'
        },

        version = '*',

        opts = {
            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            signature = { enabled = true },
            sources = {
                default = { 'lsp', 'path', 'buffer', 'avante' },
                -- cmdline = {}, -- Disable sources for command-line mode
                providers = {
                    avante = {
                        module = 'blink-cmp-avante',
                        name = 'Avante',
                        opts = {
                            -- options for blink-cmp-avante
                        }
                    }
                },
            },
        },
    }
}
