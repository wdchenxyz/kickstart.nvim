return {
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ":TSUpdate",
        main = 'nvim-treesitter.configs', -- Sets main module to use for opts

        opts = {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'java',
                'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,
            highlight = { enable = true, additional_vim_regex_highlighting = { "markdown" }, },
            indent = { enable = true, disable = { 'python' } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-s>',
                    node_incremental = '<C-s>',
                    scope_incremental = '<S-space>',
                    node_decremental = '<M-space>',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer',
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer',
                    },
                },
                swap = {
                    enable = true,
                    --             swap_next = {
                    --                 ['<leader>a'] = '@parameter.inner',
                    --             },
                    --             swap_previous = {
                    --                 ['<leader>A'] = '@parameter.inner',
                    --             },
                },
            }
        },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function(_, opts)
            local context = require('treesitter-context')
            context.setup(opts)
            -- use gC to jump back to the parent scope without colliding with Comment.nvim's gc
            vim.keymap.set('n', 'gC', context.go_to_context, { silent = true, desc = 'TS context: go to parent' })
        end,
        opts = {
            max_lines = 5,            -- never render more than three context lines
            multiline_threshold = 5,  -- collapse scopes that span more than three lines
        },
    }
}
