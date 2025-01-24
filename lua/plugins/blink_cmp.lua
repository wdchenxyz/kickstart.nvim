return {
    {
        'saghen/blink.cmp',
        enabled = true,
        dependencies = 'rafamadriz/friendly-snippets',

        version = '*',

        opts = {
            keymap = { preset = 'default' },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            signature = { enabled = true },
            sources = {
                default = { "lsp", "path", "buffer", "codecompanion" },
                -- cmdline = {}, -- Disable sources for command-line mode
            },
        },
    },
}
