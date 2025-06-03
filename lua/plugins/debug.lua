require('lze').load {
    {
        "nvim-dap",
        keys = {
            {
                "<leader>du",
                "<cmd>lua require('dapui').toggle()<cr>",
                desc = "Toggle UI",
            },
            {
                "<leader>db",
                "<cmd>lua require('dap').toggle_breakpoint()<cr>",
                desc = "Toggle Breakpoint",
            },
            {
                "<leader>dc",
                "<cmd>lua require('dap').continue()<cr>",
                desc = "Continue",
            },
            {
                "<leader>dr",
                "<cmd>lua require('dap').repl.open()<cr>",
                desc = "Inspect",
            },
            {
                "<leader>dt",
                "<cmd>lua require('dap').terminate()<cr>",
                desc = "Termintate",
            },
            {
                "<leader>dso",
                "<cmd>lua require('dap').step_over()<cr>",
                desc = "Step Over",
            },
            {
                "<leader>dsi",
                "<cmd>lua require('dap').step_into()<cr>",
                desc = "Step Into",
            },
            {
                "<leader>dsu",
                "<cmd>lua require('dap').step_out()<cr>",
                desc = "Step Out",
            },
            {
                "<leader>dl",
                "<cmd>lua require('dap').run_last()<cr>",
                desc = "Run Last",
            },
        },
        after = function()
            local dap = require('dap')
            require('dapui').setup()
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
            }
            dap.configurations.c = {
                {
                    name = "Launch",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
                {
                    name = "Select and attach to process",
                    type = "gdb",
                    request = "attach",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    pid = function()
                        local name = vim.fn.input('Executable name (filter): ')
                        return require("dap.utils").pick_process({ filter = name })
                    end,
                    cwd = '${workspaceFolder}'
                },
                {
                    name = 'Attach to gdbserver :1234',
                    type = 'gdb',
                    request = 'attach',
                    target = 'localhost:1234',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}'
                },
            }
        end,
    },
    {
        "nvim-dap-ui",
        dep_of = "nvim-dap",
    },
    {
        "nvim-nio",
        dep_of = "nvim-dap-ui",
    },
}
