return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',

    dependencies = {
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
        local cmp_lsp = require("cmp_nvim_lsp")

        local capabilities = vim.tbl_deep_extend(
            "force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

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
            }
        })
    end
}
