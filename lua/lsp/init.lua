require('lze').register_handlers(require('lzextras').lsp)
require('lze').load {
    {
        "nvim-lspconfig",
        on_require = { "lspconfig" },

        lsp = function(plugin)
            vim.lsp.config(plugin.name, plugin.lsp or {})
            vim.lsp.enable(plugin.name)
        end,
        before = function(_)
            vim.lsp.config('*', {
                on_attach = require('lsp.lsp-attach'),
            })
        end,
    },

    {
        "lazydev.nvim",
        cmd = { "LazyDev" },
        ft = "lua",
        after = function(_)
            require('lazydev').setup({
                library = {
                    { words = { "nixCats" }, path = (nixCats.nixCatsPath or "") .. '/lua' },
                },
            })
        end,
    },
    {
        "lua_ls",
        lsp = {
            -- if you provide the filetypes it doesn't ask lspconfig for the filetypes
            filetypes = { 'lua' },
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    formatters = {
                        ignoreComments = true,
                    },
                    signatureHelp = { enabled = true },
                    diagnostics = {
                        globals = { "nixCats", "vim", },
                        disable = { 'missing-fields' },
                    },
                    telemetry = { enabled = false },
                },
            },
        },
    },
    {
        "jdtls",
        lsp = {},
    },
    {
        "clangd",
        lsp = {
            filetypes = { 'c', 'cpp' },
            -- clangd has some defaults set by lspconfig so i need this extra line here
            -- it should always match the lsp-attach file that is sourced by lspconfig
            on_attach = require('lsp.lsp-attach'),
            -- settings = {
            --     clangd = {
            --         formatting = {
            --             command = { "clang-format"}
            --         }
            --     }
            -- }
        },
    },
    {
        "rust_analyzer",
        lsp = {
            -- rust-analyzer has some defaults set by lspconfig so i need this extra line here
            -- it should always match the lsp-attach file that is sourced by lspconfig
            on_attach = require('lsp.lsp-attach'),
        },
    },
    {
        -- TODO: look into nixCats docs or example template for config
        "nixd",
        lsp = {
            filetypes = { 'nix' },
            cmd = { "nixd" },
            settings = {
                nixd = {
                    formatting = {
                        command = { "alejandra" },
                    },
                    -- nixpkgs = {
                    --     expr = "import <nixpkgs> { }",
                    --     expr = 'import (builtins.getFlake "/home/tim/nixos").inputs.nixpkgs {}',
                    -- },
                    -- options = {
                    --     --If you integrated with your system flake,
                    --     --you should use inputs.self as the path to your system flake
                    --     -- that way it will ALWAYS work, regardless
                    --     -- of where your config actually was.
                    --     nixos = {
                    --         -- expr = '(builtins.getFlake "github:zimtech/nixos").nixosConfigurations.PC.options',
                    --         expr = '(builtins.getFlake "/home/tim/nixos").nixosConfigurations.PC.options',
                    --     },
                    --     home_manager = {
                    --         expr = '(builtins.getFlake "/home/tim/nixos").homeConfigurations.tim.options',
                    --     },
                    -- }
                },
            },
        },
    },
}
