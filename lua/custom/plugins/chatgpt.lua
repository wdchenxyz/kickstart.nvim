return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require("chatgpt").setup({
        api_key_cmd = "echo $OPENAI_API_KEY"
      })
      vim.keymap.set('n', '<leader>cg', require('chatgpt').openChat, { desc = '[C]hat [G]pt' })
      vim.keymap.set('v', '<leader>ci', require('chatgpt').edit_with_instructions, { desc = '[C]hat [I]nstructions' })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
}
