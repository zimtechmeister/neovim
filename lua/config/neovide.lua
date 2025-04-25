if vim.g.neovide then
    vim.o.guifont = "FiraCode Nerd Font:h12"
    vim.g.neovide_confirm_quit = true

    -- zoom in/out
    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1 / 1.25)
    end)
    vim.keymap.set("n", "<C-0>", function()
        vim.g.neovide_scale_factor = 1.0
    end)
end
