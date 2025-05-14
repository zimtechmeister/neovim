local servers = {}
servers.lua_ls = {
    settings = {
        Lua = {
            signatureHelp = { enabled = true },
            diagnostics = {
                globals = { 'nixCats' },
                disable = { 'missing-fields' },
            },
        },
        telemetry = { enabled = false },
    },
    filetypes = { 'lua' },
}
servers.jdtls = {}
servers.clangd = {}
servers.clangd = {}
servers.eslint = {}
servers.ts_ls = {}
servers.nixd = {
    cmd = { "nixd" },
    settings = {
        nixd = {
            formatting = {
                command = { "alejandra" },
            },
            -- nixpkgs = {
            --     expr = "import <nixpkgs> { }",
            --     expr = 'import (builtins.getFlake "/home/tim/nixos").inputs.nixpkgs {}',
            --     -- saw this one in the nixCats docs
            --     expr = nixCats.extra("nixdExtras.nixpkgs") or [[import <nixpkgs> {}]],
            -- },
            -- options = {
            --     nixos = {
            --         -- expr = '(builtins.getFlake "github:zimtech/nixos").nixosConfigurations.PC.options',
            --         expr = '(builtins.getFlake "/home/tim/nixos").nixosConfigurations.PC.options',
            --     },
            --     home_manager = {
            --         expr = '(builtins.getFlake "/home/tim/nixos").homeConfigurations.tim.options',
            --     },
            -- }
        }
    }
}

-- dont know if i need these capabilities also does not recognize what blink
-- local capabilities = require('blink.cmp').get_lsp_capabilities()
vim.lsp.config('*', {
    -- capabilities = capabilities,
    on_attach = function(_, bufnr)
        vim.keymap.set({ 'n', 'x' }, '<leader>l', '<cmd>lua vim.lsp.buf.format({async = true})<cr>',
            { desc = 'format buffer', buffer = bufnr })
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
            { desc = 'rename buffer', buffer = bufnr })
        vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>',
            { desc = 'code actions', buffer = bufnr })

        -- NOTE: all following is coppied from nixCats docs
        -- we create a function that lets us more easily define mappings specific
        -- for LSP related items.-It sets the mode, buffer and description for us each time.
        -- local nmap = function(keys, func, desc)
        --     if desc then
        --         desc = 'LSP: ' .. desc
        --     end
        --     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        -- end
        --
        -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        -- nmap('gr', function() Snacks.picker.lsp_references() end, '[G]oto [R]eferences')
        -- nmap('gI', function() Snacks.picker.lsp_implementations() end, '[G]oto [I]mplementation')
        -- nmap('<leader>ds', function() Snacks.picker.lsp_symbols() end, '[D]ocument [S]ymbols')
        -- nmap('<leader>ws', function() Snacks.picker.lsp_workspace_symbols() end, '[W]orkspace [S]ymbols')
        --
        -- -- See `:help K` for why this keymap
        -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
        --
        -- -- Lesser used LSP functionality
        -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        -- nmap('<leader>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, '[W]orkspace [L]ist Folders')
        --
        -- -- Create a command `:Format` local to the LSP buffer
        -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        --     vim.lsp.buf.format()
        -- end, { desc = 'Format current buffer with LSP' })
    end,
})

-- set up the servers to be loaded on the appropriate filetypes!
for server_name, cfg in pairs(servers) do
    vim.lsp.config(server_name, cfg)
    vim.lsp.enable(server_name)
end
