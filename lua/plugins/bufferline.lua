require('lze').load {
    "bufferline.nvim",
    event = "DeferredUIEnter",
    after = function()
        require('bufferline').setup({
            options = {
                numbers = "ordinal"
            },
        })
    end,
}
vim.keymap.set("n", "<leader>tp", vim.cmd.BufferLineTogglePin, { desc = 'Toggle Pin' })
vim.keymap.set("n", "<leader>tt", vim.cmd.BufferLinePick, { desc = 'Pick Buffer' })
vim.keymap.set("n", "<C-h>", vim.cmd.BufferLineCyclePrev, { desc = 'Prev Buffer' })
vim.keymap.set("n", "<C-l>", vim.cmd.BufferLineCycleNext, { desc = 'Next Buffer' })
vim.keymap.set("n", "<A-h>", vim.cmd.BufferLineMovePrev, { desc = 'Move Buffer Left' })
vim.keymap.set("n", "<A-l>", vim.cmd.BufferLineMoveNext, { desc = 'Move Buffer Right' })

for i = 1, 9 do
    vim.keymap.set("n", "<leader>t" .. i, function()
        vim.cmd("BufferLineGoToBuffer " .. i)
    end, { desc = "Go to buffer " .. i })
end
