return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.barbar_auto_setup = false -- Disable auto-setup
    end,
    opts = {
        -- Configure animation
        animation = true,
        -- Configure offset
        sidebar_filetypes = {
            -- Use the default values: {event = 'BufWinLeave', text = nil}
            NvimTree = true,
            -- For Neo-tree
            ["neo-tree"] = {event = 'BufWinLeave', text = nil},
        },
        -- Offset separators
        offset_separator = {
            left = '|',
            right = '|',
        },
    },
}
