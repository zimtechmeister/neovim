return {
    {
        'nvim-treesitter',
        event = "DeferredUIEnter",
        after = function(plugin)
            require('nvim-treesitter.configs').setup {
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                textobjects = {
                    enable = true,
                },
            }
        end,
    },
}
