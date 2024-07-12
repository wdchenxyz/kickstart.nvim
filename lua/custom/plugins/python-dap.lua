return {
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio"
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      vim.keymap.set('n', '<leader>dpr', require('dap-python').test_method, { desc = '[r] debug python run (method)' })
      vim.keymap.set('n', '<leader>dpc', require('dap-python').test_class, { desc = '[c] debug python class' })
      vim.keymap.set('v', '<leader>dps', require('dap-python').debug_selection, { desc = '[s] debug python selection' })
    end,
  }
}
