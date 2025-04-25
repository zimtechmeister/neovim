require('lze').load {
    "todo-comments.nvim",
    event = "DeferredUIEnter",
    after = function(plugin)
        require('todo-comments').setup()
    end,
}
