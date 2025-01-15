return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        { "<leader>xx", ":TroubleToggle<CR>", silent = true, noremap = true },
        {"<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", silent = true, noremap = true },
        {"<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", silent = true, noremap = true },
        {"<leader>xl", "<cmd>TroubleToggle loclist<cr>", silent = true, noremap = true },
        {"<leader>xq", "<cmd>TroubleToggle quickfix<cr>", silent = true, noremap = true },
        {"<leader>gR", "<cmd>TroubleToggle lsp_references<cr>", silent = true, noremap = true }
    }
}
