return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "hrsh7th/cmp-nvim-lsp",
        -- "hrsh7th/cmp-buffer",
        -- "hrsh7th/cmp-path",
        -- "hrsh7th/cmp-cmdline",
        -- "hrsh7th/nvim-cmp",
        -- "L3MON4D3/LuaSnip",
        -- "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
        "saghen/blink.cmp"
    },

    config = function()
        -- local cmp_lsp = require("cmp_nvim_lsp").default_capabilities()
        local blink_cap = require('blink.cmp').get_lsp_capabilities()

        local capabilities = vim.tbl_deep_extend(
            "force", {}, vim.lsp.protocol.make_client_capabilities(),blink_cap)

        require('neodev').setup()
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = false,
            ensure_installed = { "lua_ls", "rust_analyzer", "pylsp" },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,

                ['pylsp'] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pylsp.setup {
                        settings = {
                            pylsp = {
                                plugins = {
                                    mccabe = { enabled = false },
                                    pycodestyle = { maxLineLength = 120 }
                                }
                            }
                        }
                    }
                end,
                ['jdtls'] = function () end,
                ['ts_ls'] = function()
                    local lspconfig = require("lspconfig")
                    local format_settings = {
                        format = {
                            indentSize = 2,
                            convertTabsToSpaces = true,
                            tabSize = 2,
                        }
                    }

                    lspconfig.ts_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            javascript = format_settings,
                            typescript = format_settings,
                        }
                    }
                end,
            }
        })
    end
}
