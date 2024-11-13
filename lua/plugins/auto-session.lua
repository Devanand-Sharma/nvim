return {
    'rmagatti/auto-session',
    config = function()
        require("auto-session").setup({
            log_level = "error",
            auto_session_enable_last_session = false,
            auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
            auto_session_enabled = true,
            auto_save_enabled = true,
            auto_restore_enabled = true,
            auto_session_suppress_dirs = nil,
            auto_session_use_git_branch = true,
            -- Save these additional items in the session
            session_lens = {
                buftypes_to_ignore = {}, -- which buftypes to ignore
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
            },
        })

        local keymap = vim.keymap.set
        keymap("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session" })
        keymap("n", "<leader>sl", "<cmd>SessionLoad<CR>", { desc = "Load session" })
        keymap("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Delete session" })
    end
} 