require('lze').load {
    {
        "vimplugin-everforest-nvim",
        colorscheme = "everforest",
        after = function()
            require('everforest').setup({
                -- background = "soft",
                -- float_style = "dim", -- bright or dim
            })
        end,
    },
}
vim.opt.termguicolors = true
vim.opt.background = 'dark'
