return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", branch = "master" },
    -- being setup in individual lua file
    -- { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    "nvim-treesitter/nvim-treesitter",
  },
  enabled = true,
  config = true,
  opts = {
    extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true
          }
        }
    },
    display = {
      chat = {
        window = {
          position = "right"
        },
        show_settings = false,         -- Show LLM settings at the top of the chat buffer?
      }
    },
    strategies = {
      chat = {
        adapter = 'openai',
        keymaps = {
          close = {
            modes = { n = "<C-x>", i = "<C-x>" },
          }
        }
      },
      inline = { adapter = 'openai' }
    },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = {
            api_key = "i have to fill it"
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
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd:security find-generic-password -a codecompanion -s Gemini_codecompanion -w"
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
      vim.keymap.set("v", "<leader>d", function() require("codecompanion").prompt("explain") end,
        { noremap = true, silent = true })
    },
  }
}
