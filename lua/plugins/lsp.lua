return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    -- dependencies = {
    --     -- Automatically install LSPs to stdpath for neovim
    --     { 'williamboman/mason.nvim', config = true },
    --     {'williamboman/mason-lspconfig.nvim'},
    --
    --     -- Useful status updates for LSP
    --     -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    --     { 'j-hui/fidget.nvim',       opts = {} },
    --
    --     -- Additional lua configuration, makes nvim stuff amazing!
    --     'folke/neodev.nvim',
    -- },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
    },

    config = function()

        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")

        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>Ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('<leader>Wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>Wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>Wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require('neodev').setup()
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "pylsp"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        -- capabilities = capabilities,
                        on_attach = on_attach
                    }
                end,
            }
        })
    end
}



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
