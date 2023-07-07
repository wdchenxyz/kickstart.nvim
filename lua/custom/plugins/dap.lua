return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup({
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        layouts = { {
          elements = { {
            id = "watches",
            size = 0.25
          }, {
            id = "scopes",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          } },
          position = "left",
          size = 40
        }, {
          elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
          position = "bottom",
          size = 10
        } },
      })
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      local dap = require 'dap'
      -- Basic debugging keymaps, feel free to change to your liking!
      vim.keymap.set('n', '<leader>l', dap.continue)
      vim.keymap.set('n', '<leader>j', dap.step_into)
      vim.keymap.set('n', '<leader>n', dap.step_over)
      vim.keymap.set('n', '<leader>k', dap.step_out)
      vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
      vim.keymap.set('n', '<leader>B', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end)
      vim.keymap.set('n', '<leader>dx', dap.terminate)
    end
  },
}
