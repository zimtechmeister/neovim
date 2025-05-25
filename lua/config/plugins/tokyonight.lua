require('lze').load {
    {
        "tokyonight.nvim",
        colorscheme = "tokyonight",
        after = function()
            require('tokyonight').setup({
                style = "moon",
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
                on_colors = function (colors)
                    colors.bg = "#000000"
                end
            })
        end
    },
}
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd.colorscheme 'tokyonight'
