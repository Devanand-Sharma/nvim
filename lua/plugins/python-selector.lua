return {
    "AckslD/swenv.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("swenv").setup({
            -- Optional: Path to search for virtual environments
            -- Default is parent directory of current file
            venvs_path = vim.fn.expand("~/.conda/envs"),
            -- Optional: Additional paths to search for virtual environments
            additional_paths = {
                vim.fn.expand("~/anaconda3/envs"),
                vim.fn.expand("~/.pyenv/versions"),
            },
            -- Optional: Custom function to get python path from virtualenv
            get_venv_python = function(venv_path)
                return venv_path .. "/bin/python"
            end,
            -- Optional: Post-hook after activating an environment
            post_set_venv = function()
                -- Restart Pyright after environment change
                vim.cmd("LspRestart")
                -- Update Pyright's pythonPath
                require('lspconfig').pyright.setup({
                    settings = {
                        python = {
                            pythonPath = vim.fn.exepath("python")
                        }
                    }
                })
            end,
        })

        -- Create command to open swenv picker
        vim.api.nvim_create_user_command("SelectPythonInterpreter", function()
            require("swenv.api").pick_venv()
        end, {})
    end
} 