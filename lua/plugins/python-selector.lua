return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values

        -- Function to find Python interpreters
        local function find_python_interpreters()
            local handle = io.popen([[
                which -a python python3 2>/dev/null
                find /usr/bin /usr/local/bin ~/anaconda3/bin ~/.conda/envs/*/bin ~/.pyenv/versions/*/bin -name "python*" 2>/dev/null
            ]])
            if not handle then return {} end
            
            local result = handle:read("*a")
            handle:close()

            local interpreters = {}
            local seen = {}
            for path in result:gmatch("[^\n]+") do
                if not seen[path] and path:match("python[23]?$") then
                    seen[path] = true
                    table.insert(interpreters, path)
                end
            end
            return interpreters
        end

        -- Function to select Python interpreter
        local function select_python_interpreter()
            local interpreters = find_python_interpreters()
            
            pickers.new({}, {
                prompt_title = "Select Python Interpreter",
                finder = finders.new_table({
                    results = interpreters,
                    entry_maker = function(entry)
                        return {
                            value = entry,
                            display = entry,
                            ordinal = entry,
                        }
                    end,
                }),
                sorter = conf.generic_sorter({}),
                attach_mappings = function(prompt_bufnr, _)
                    actions.select_default:replace(function()
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        
                        -- Set the Python interpreter for the LSP
                        if selection then
                            -- Update Pyright configuration
                            require('lspconfig').pyright.setup({
                                settings = {
                                    python = {
                                        pythonPath = selection.value
                                    }
                                }
                            })
                            
                            -- Restart Pyright
                            vim.cmd("LspRestart")
                            
                            -- Notify user
                            vim.notify("Python interpreter set to: " .. selection.value, 
                                     vim.log.levels.INFO, 
                                     { title = "Python Interpreter" })
                        end
                    end)
                    return true
                end,
            }):find()
        end

        -- Add command to select interpreter
        vim.api.nvim_create_user_command("SelectPythonInterpreter", select_python_interpreter, {})
    end
} 