return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim",                     branch = "master" },
        { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
        "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    opts = {
        display = {
            chat = {
                window = {
                    position = "right"
                }
            }
        },
        strategies = {
            chat = { adapter = 'openai' },
            inline = { adapter = 'openai' }
        },
        adapters = {
            ollama = function()
                return require("codecompanion.adapters").extend("ollama", {
                    env = {
                        api_key = "hello"
                    },
                    schema = {
                        model = {
                            default = "gemma2:2b",
                        }
                    }
                })
            end,
            openai = function()
                return require("codecompanion.adapters").extend("openai", {
                    env = {
                        api_key = "cmd:security find-generic-password -a codecompanion -s OpenAI_codecompanion -w"
                    },
                    schema = {
                        model = {
                            default = "gpt-4o-mini"
                        }
                    }
                })
            end,
            anthropic = function()
                return require("codecompanion.adapters").extend("anthropic", {
                    env = {
                        api_key = "cmd:security find-generic-password -a codecompanion -s Claude_codecompanion -w"
                    }
                })
            end,
        },
        keys = {
            vim.cmd([[cab cc CodeCompanion]]),
            vim.cmd([[cab cct CodeCompanionChat]]),
            vim.cmd([[cab cca CodeCompanionActions<cr>]]),
            vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true }),
            vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true }),
        },
    }
}
