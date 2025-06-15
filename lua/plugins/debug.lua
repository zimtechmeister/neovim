require('lze').load {
    {
        "nvim-dap",
        keys = {
            { "<leader>du",  function() require('dapui').toggle() end,                                             desc = "Toggle Dap UI" },
            { "<leader>de",  function() require('dapui').eval() end,                                               desc = "Eval" },

            { "<leader>db",  function() require('dap').toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
            { "<leader>dB",  function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },

            { "<leader>dc",  function() require('dap').continue() end,                                             desc = "Run/Continue" },
            { "<leader>da",  function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
            { "<leader>dC",  function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
            { "<leader>dg",  function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },

            { "<leader>dj",  function() require("dap").down() end,                                                 desc = "Down" },
            { "<leader>dk",  function() require("dap").up() end,                                                   desc = "Up" },

            { "<leader>dl",  function() require('dap').run_last() end,                                             desc = "Run Last" },

            { "<leader>dsi", function() require('dap').step_into() end,                                            desc = "Step Into" },
            { "<leader>dso", function() require('dap').step_out() end,                                             desc = "Step Out" },
            { "<leader>dsO", function() require('dap').step_over() end,                                            desc = "Step Over" },

            { "<leader>dP",  function() require("dap").pause() end,                                                desc = "Pause" },
            { "<leader>dr",  function() require('dap').repl.toggle() end,                                          desc = "Toggle REPL" },
            { "<leader>ds",  function() require("dap").session() end,                                              desc = "Session" },
            { "<leader>dt",  function() require("dap").terminate() end,                                            desc = "Terminate" },
            { "<leader>dw",  function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },


        },
        after = function()
            local dap = require('dap')
            require('dapui').setup()
            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
            }
            for _, lang in ipairs({ "c", "cpp" }) do
                dap.configurations[lang] = {
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
            end
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
    {
        "nvim-dap-virtual-text",
        dep_of = "nvim-dap",
    },
}
