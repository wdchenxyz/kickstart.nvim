-- colors

require('rose-pine').setup({
    disable_background = true,
    styles = {
        italic = false
    }
})

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3a3a3a" })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#DDFFBB', bold = true })
    vim.api.nvim_set_hl(0, 'Visual', { reverse = true, bg = "#3a3a3a" })
    -- vim.cmd('highlight GitsignsAdd guibg=none')
    -- vim.cmd('highlight GitsignsDelete guibg=none')
    -- vim.cmd('highlight GitsignsChange guibg=none')
end

ColorMyPencils()
