return {
    {
        "blink.cmp",
        event = "DeferredUIEnter",
        after = function(plugin)
            require("blink.cmp").setup {
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                completion = {
                    documentation = {
                        auto_show = true,
                        window = {
                            border = 'single',
                        }
                    },
                    menu = {
                        auto_show = true,
                        border = 'single',
                    },
                },
                signature = {
                    enabled = true,
                },
                cmdline = {
                    enabled = true,
                    completion = {
                        menu = {
                            auto_show = true,
                        },
                        ghost_text = {
                            enabled = false,
                        },
                    },
                }
            }
        end,
    },
}
