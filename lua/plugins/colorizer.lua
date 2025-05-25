return {
    {
        "colorizer",
        event = "DeferredUIEnter",
        after = function()
            vim.opt.termguicolors = true
        end
    },
}
