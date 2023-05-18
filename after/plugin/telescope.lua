local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

local telescope = require('telescope')

-- Set up custom configuration options for Telescope
local custom_options = {
    pickers = {
        find_files = {
            no_ignore = false
        }
    }
}

-- Apply the custom options using the setup function
telescope.setup(custom_options)
