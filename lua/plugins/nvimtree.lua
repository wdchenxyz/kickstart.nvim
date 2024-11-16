return {
    'nvim-tree/nvim-tree.lua',
    keys = {
        -- Define key bindings here
        { "<leader>o", ":NvimTreeToggle<CR>",  desc = "Toggle Nvim Tree" },
        { "<leader>r", ":NvimTreeRefresh<CR>", desc = "Refresh Nvim Tree" },
    },
    opts = {}
}
