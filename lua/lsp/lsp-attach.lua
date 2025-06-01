return function(_, bufnr)
    -- NOTE: for sane defaults checkout the "lsp.on_attach.lua" file in nixCats example template
    -- https://github.com/BirdeeHub/nixCats-nvim/blob/main/templates/example/lua/myLuaConf/LSPs/on_attach.lua
    -- also shown in nixCats docs(lsp)

    -- TODO: dont know if this is the correct place to do this
    vim.diagnostic.config({
        -- hoide anoying underline on warnings or errors
        underline = false,
        -- use nerdfont symbols for diagnostics on left
        float = {
            border = "rounded",
            source = true,
        },
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.INFO] = " ",
                [vim.diagnostic.severity.HINT] = " ",
            },
            numhl = {
                [vim.diagnostic.severity.ERROR] = "ErrorMsg",
                [vim.diagnostic.severity.WARN] = "WarningMsg",
            },
        },
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
        { desc = 'format buffer', buffer = bufnr })
    vim.keymap.set('n', '<leader>lj', '<cmd>lua vim.diagnostic.open_float()<cr>',
        { desc = 'show diagnostic' })
    vim.keymap.set('n', '<leader>lk', '<cmd>lua vim.lsp.buf.hover()<cr>',
        { desc = 'hover', buffer = bufnr })
    vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>',
        { desc = 'definition', buffer = bufnr })
    vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
        { desc = 'declaration', buffer = bufnr })
    vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>',
        { desc = 'implementation', buffer = bufnr })
    vim.keymap.set('n', '<leader>lo', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
        { desc = 'type definition', buffer = bufnr })
    vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>',
        { desc = 'references', buffer = bufnr })
    vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>',
        { desc = 'signature help', buffer = bufnr })
    vim.keymap.set('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>',
        { desc = 'rename', buffer = bufnr })
    vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>',
        { desc = 'code actions', buffer = bufnr })
end
