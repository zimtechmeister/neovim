return {
    {
        "gitsigns.nvim",
        event = "DeferredUIEnter",
        after = function(plugin)
            require('gitsigns').setup({
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            })
        end,
    }
}
