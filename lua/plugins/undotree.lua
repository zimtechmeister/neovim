require('lze').load {
    {
        "undotree",
        cmd = { "UndotreeToggle", "UndotreeHide", "UndotreeShow", "UndotreeFocus", "UndotreePersistUndo", },
        keys = {
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = '[U]ndotreeToggle' })
        },
        before = function(_)
            vim.g.undotree_WindowLayout = 4
            vim.g.undotree_ShortIndicators = 1
        end,
    },
}
