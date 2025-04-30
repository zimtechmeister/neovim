require('lze').load {
    { import = "config.plugins.treesitter", },
    { import = "config.plugins.blink", },
    { import = "config.plugins.lualine", },
    { import = "config.plugins.colorizer", },
    { import = "config.plugins.gitsigns", },
    {
        "noice.nvim",
        event = "DeferredUIEnter",
        after = function(plugin)
            require('noice').setup()
        end
    },
}

-- NOTE: you can also load plugins without lze (lze does more than lazyloading)
-- vim.cmd.packadd('noice.nvim')
-- require('noice').setup()

-- require('config.plugins.gruvbox')
require('config.plugins.gruvbox')

require('config.plugins.bufferline')
require('config.plugins.markdown-preview')
require('config.plugins.undotree')
require('config.plugins.flash')
require('config.plugins.todo-comments')
require('config.plugins.which-key')
require('config.plugins.trouble')
require('config.plugins.snacks')
require('config.plugins.mini')
require('config.plugins.lsp') -- NOTE: lsp in plugins dir? (does not need lze)
