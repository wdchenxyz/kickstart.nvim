-- Set up custom configuration options for Telescope
local custom_options = {
    defaults = {
        layout_strategy = 'vertical',
        path_display = { 'shorten' },
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
    pickers = {
        find_files = {
            no_ignore = false,
            path_display = { 'smart' },
        },
        lsp_references = {
            fname_width = 60,
            path_display = { 'smart' },
        },
    },
    extensions = {
        fzf = {}
    }
}

return {
    {
        -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },

        config = function()
            require('telescope').setup(custom_options)
            require('telescope').load_extension('fzf')
            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })
            vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
            vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

            -- See `:help telescope.builtin`
            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_ivy {
                    winblend = 10,
                    previewer = false,
                    layout_config = {
                        height = 20
                    }
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            -- when I want to modify the nvim config
            vim.keymap.set('n', '<leader>en', function()
                require('telescope.builtin').find_files {
                    cwd = vim.fn.stdpath('config')
                }
            end)

            -- when I want to find the hidden files
            vim.keymap.set('n', '<leader>eh', function()
                require('telescope.builtin').find_files {
                    hidden = true, -- Include hidden files
                    no_ignore = false, -- Respect .gitignore
                    path_display = { 'smart' } -- Keep the existing path display
                }
            end, { desc = '[S]earch [H]idden [F]iles' })


            require('config.telescope.multigrep').setup()
        end
    },
}
