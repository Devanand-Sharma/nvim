return {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
        -- Disable the default 's' key behavior
        vim.keymap.set('n', 's', '<Nop>', { silent = true })
        
        require('mini.surround').setup({
            -- Custom keymaps using 's' as prefix
            mappings = {
                add = 'sa',            -- Add surrounding in Normal and Visual modes
                delete = 'sd',         -- Delete surrounding
                find = 'sf',           -- Find surrounding (to the right)
                find_left = 'sF',      -- Find surrounding (to the left)
                highlight = 'sh',      -- Highlight surrounding
                replace = 'sr',        -- Replace surrounding
                update_n_lines = 'sn', -- Update `n_lines`
            },
            -- How to use:
            -- sa{motion}{char} - add surrounding
            -- sd{char}         - delete surrounding
            -- sr{char}{repl}   - replace surrounding
            -- sf{char}         - find surrounding (to the right)
            -- sF{char}         - find surrounding (to the left)
            
            -- Number of lines within which surrounding is searched
            n_lines = 20,
            
            -- Whether to respect selection type
            respect_selection_type = false,
            
            -- How to search for surrounding
            search_method = 'cover',
        })
    end,
} 