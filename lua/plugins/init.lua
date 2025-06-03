require('lze').load {
    { import = "plugins.treesitter", },
    { import = "plugins.blink", },
    { import = "plugins.lualine", },
    { import = "plugins.colorizer", },
    { import = "plugins.gitsigns", },
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

require('plugins.bufferline')
require('plugins.markdown-preview')
require('plugins.undotree')
require('plugins.flash')
require('plugins.todo-comments')
require('plugins.which-key')
require('plugins.trouble')
require('plugins.snacks')
require('plugins.mini')
require('plugins.debug')
