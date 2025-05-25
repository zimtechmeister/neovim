require('lze').load {
    "which-key.nvim",
    event = "DeferredUIEnter",
    after = function(plugin)
        require('which-key').setup({
            preset = "helix",
        })
    end,
}
