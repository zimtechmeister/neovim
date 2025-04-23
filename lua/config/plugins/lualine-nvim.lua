require('lze').load {
    {
        "gruvbox.nvim",
        colorscheme = "gruvbox",
    },
    {
        "noice.nvim",
        require('noice').setup()
    },
    {
        "bufferline.nvim",
        keys = {
            -- which way is better? the top one is from docs
            -- { "n", "<leader>ft", vim.cmd.BufferLineTogglePin, desc = "Toggle Pin" },
            vim.keymap.set("n", "<leader>tp", vim.cmd.BufferLineTogglePin, { desc = 'Toggle Pin' }),
            vim.keymap.set("n", "<leader>tt", vim.cmd.BufferLinePick, { desc = 'Pick Buffer' }),
            vim.keymap.set("n", "<C-h>", vim.cmd.BufferLineCyclePrev, { desc = 'Prev Buffer' }),
            vim.keymap.set("n", "<C-l>", vim.cmd.BufferLineCycleNext, { desc = 'Next Buffer' }),
            vim.keymap.set("n", "<A-h>", vim.cmd.BufferLineMovePrev, { desc = 'Move Buffer Left' }),
            vim.keymap.set("n", "<A-l>", vim.cmd.BufferLineMoveNext, { desc = 'Move Buffer Right' }),
        },
        after = function()
            require('bufferline').setup({
                options = {
                    numbers = "ordinal"
                },
            })
        end,
    },
    {
        "lualine.nvim",
        for_cat = 'general.always',
        -- cmd = { "" },
        event = "DeferredUIEnter",
        -- ft = "",
        -- keys = "",
        -- colorscheme = "",
        after = function(plugin)
            require('lualine').setup({
                options = {
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_c = { { 'filename', path = 1, }, "macro_recording", "%S" },
                },
            })
        end,
    },
}
