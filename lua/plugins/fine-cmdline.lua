return {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim"
    },
    config = function()
        vim.api.nvim_set_keymap(
            "n",
            ":", 
            "<cmd>FineCmdline<CR>",
            {noremap = true}
        )
        
        require('fine-cmdline').setup({
            cmdline = {
                enable_keymaps = true,
                smart_history = true,
                prompt = '  '
            },
            popup = {
                position = {
                    row = '30%',
                    col = '50%',
                },
                size = {
                    width = '60%',
                },
                border = {
                    style = "rounded",
                    text = {
                        top = " Command Line ",
                        top_align = "center",
                    },
                },
                win_options = {
                    winhighlight = 'NormalFloat:Normal,FloatBorder:FloatBorder',
                    winblend = 0,
                },
            },
        })
    end,
}
