return {
    'ThePrimeagen/harpoon',
    keys = {
        { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Add file to Harpoon" },
        { "<C-e>",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon quick menu" },
        { "<C-t>",     function() require("harpoon.ui").nav_file(1) end,         desc = "Navigate to Harpoon file 1" },
        { "<C-h>",     function() require("harpoon.ui").nav_file(2) end,         desc = "Navigate to Harpoon file 2" },
        { "<C-j>",     function() require("harpoon.ui").nav_file(3) end,         desc = "Navigate to Harpoon file 3" },
        { "<C-n>",     function() require("harpoon.ui").nav_file(4) end,         desc = "Navigate to Harpoon file 4" },
    },
    opts = {}
}
