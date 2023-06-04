-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
vim.opt.list = true
vim.opt.listchars:append "trail:⋅"

local opts = {
    char = '┊',
    show_trailing_blankline_indent = false,
}

require('indent_blankline').setup(opts)
