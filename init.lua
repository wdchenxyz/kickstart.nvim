require("config")
-- -- NOTE: Here is where you install your plugins.
-- --  You can configure plugins using the `config` key.
-- --
-- --  You can also configure plugins after the setup call,
-- --    as they will be available in your neovim runtime.
-- require('lazy').setup({
--     -- NOTE: First, some plugins that don't require any configuration
--
--     -- Detect tabstop and shiftwidth automatically
--     'tpope/vim-sleuth',
--
--     -- vim be good practice game
--     { 'ThePrimeagen/vim-be-good' },
--
--
--     {
--         -- Theme inspired by Atom
--         'navarasu/onedark.nvim',
--         priority = 1000,
--         config = function()
--             vim.cmd.colorscheme 'onedark'
--         end,
--     },
--
--     {
--         'rose-pine/neovim',
--     },
--
--     {
--         -- Set lualine as statusline
--         'nvim-lualine/lualine.nvim',
--         -- See `:help lualine.txt`
--         opts = {
--             options = {
--                 icons_enabled = false,
--                 theme = 'jellybeans',
--                 component_separators = '|',
--                 section_separators = '',
--             },
--         },
--     },
--
--     {
--         -- Add indentation guides even on blank lines
--         { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }
--     },
--
--
--     { 'ThePrimeagen/harpoon' },
--
--     { 'folke/zen-mode.nvim' },
--     { 'github/copilot.vim' },
--     {
--         'stevearc/aerial.nvim',
--         opts = {},
--         -- Optional dependencies
--         dependencies = {
--             "nvim-treesitter/nvim-treesitter",
--             "nvim-tree/nvim-web-devicons"
--         },
--     },
--
--     -- change, delete, add surrounding pairs
--     { 'tpope/vim-surround' },
--
--     -- pairs completion
--     { 'echasnovski/mini.pairs', version = false },
--
--     { 'folke/zen-mode.nvim' },
--
--     -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
--     --       These are some example plugins that I've included in the kickstart repository.
--     --       Uncomment any of the lines below to enable them.
--     require 'kickstart.plugins.autoformat',
--     -- require 'kickstart.plugins.debug',
--
--     -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
--     --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
--     --    up-to-date with whatever is in the kickstart repo.
--     --
--     --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
--     --
--     --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
--     --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
--     { import = 'custom.plugins' },
-- }, {})
--
--
--
-- -- LSP settings.
-- --  This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(_, bufnr)
--     -- NOTE: Remember that lua is a real programming language, and as such it is possible
--     -- to define small helper and utility functions so you don't have to repeat yourself
--     -- many times.
--     --
--     -- In this case, we create a function that lets us more easily define mappings specific
--     -- for LSP related items. It sets the mode, buffer and description for us each time.
--     local nmap = function(keys, func, desc)
--         if desc then
--             desc = 'LSP: ' .. desc
--         end
--
--         vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--     end
--
--     nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
--     nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
--
--     nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
--     nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--     nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
--     nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
--     nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
--     nmap('<leader>Ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--     -- See `:help K` for why this keymap
--     nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--     nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
--
--     -- Lesser used LSP functionality
--     nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--     nmap('<leader>Wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--     nmap('<leader>Wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--     nmap('<leader>Wl', function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, '[W]orkspace [L]ist Folders')
--
--     -- Create a command `:Format` local to the LSP buffer
--     vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--         vim.lsp.buf.format()
--     end, { desc = 'Format current buffer with LSP' })
-- end
--
-- -- Enable the following language servers
-- --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
-- --
-- --  Add any additional override configuration in the following tables. They will be passed to
-- --  the `settings` field of the server config. You must look up that documentation yourself.
-- local servers = {
--     -- clangd = {},
--     -- gopls = {},
--     -- pyright = {},
--     -- rust_analyzer = {},
--     tsserver = {},
--     -- jdtls = {},
--     pylsp = {
--         pylsp = {
--             plugins = {
--                 mccabe = { enabled = false },
--                 pycodestyle = {
--                     maxLineLength = 120
--                 }
--             }
--         }
--     },
--
--     lua_ls = {
--         Lua = {
--             workspace = { checkThirdParty = false },
--             telemetry = { enable = false },
--         },
--     },
-- }
--
-- -- Setup neovim lua configuration
-- require('neodev').setup()
--
-- -- Ensure the servers above are installed
-- local mason_lspconfig = require 'mason-lspconfig'
--
-- mason_lspconfig.setup {
--     ensure_installed = vim.tbl_keys(servers),
-- }
--
-- local noop = function() end
--
-- mason_lspconfig.setup_handlers {
--     function(server_name)
--         require('lspconfig')[server_name].setup {
--             on_attach = on_attach,
--             settings = servers[server_name],
--         }
--     end,
--     ['jdtls'] = noop,
-- }
--
-- -- nvim-cmp setup
-- local cmp = require('cmp')
-- local luasnip = require('luasnip')
--
-- luasnip.config.setup {}
--
-- cmp.setup {
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body)
--         end,
--     },
--     mapping = cmp.mapping.preset.insert {
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--         ['<C-Space>'] = cmp.mapping.complete {},
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'luasnip' },
--
--     },
-- }
--
-- -- cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
-- --     sources = {
-- --         { name = "dap" },
-- --     },
-- -- })
--
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_filetypes = {
--     ['dap-repl'] = false,
--     ['dap-watches'] = false
-- }
--
--
-- -- run debug
-- -- local function get_test_runner(test_name, debug)
-- --     if debug then
-- --         return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"'
-- --     end
-- --     return 'mvn test -Dtest="' .. test_name .. '"'
-- -- end
-- --
-- -- local function run_java_test_method(debug)
-- --     local utils = require 'dagg.utils'
-- --     local method_name = utils.get_current_full_method_name("\\#")
-- --     vim.cmd('term ' .. get_test_runner(method_name, debug))
-- -- end
-- --
-- -- local function run_java_test_class(debug)
-- --     local utils = require 'dagg.utils'
-- --     local class_name = utils.get_current_full_class_name()
-- --     vim.cmd('term ' .. get_test_runner(class_name, debug))
-- -- end
-- --
-- -- vim.keymap.set("n", "<leader>tm", function() run_java_test_method() end)
-- -- vim.keymap.set("n", "<leader>TM", function() run_java_test_method(true) end)
-- -- vim.keymap.set("n", "<leader>tc", function() run_java_test_class() end)
-- -- vim.keymap.set("n", "<leader>TC", function() run_java_test_class(true) end)
-- --
-- -- -- setup debug
-- -- vim.keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
-- -- vim.keymap.set('n', '<leader>B', ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
-- -- vim.keymap.set('n', '<leader>bl', ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>')
-- -- vim.keymap.set('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')
--
--
-- -- The line beneath this is called `modeline`. See `:help modeline`
-- -- vim: ts=4 sts=4 sw=4 et
