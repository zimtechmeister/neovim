require('lze').load {
    "markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle", },
    ft = "markdown",
    keys = {
        vim.keymap.set('n', '<leader>M', "<cmd>MarkdownPreviewToggle <CR>", { desc = '[M]arkdown Preview Toggle' })
    },
    before = function(plugin)
        vim.g.mkdp_auto_close = 0
    end,
}
