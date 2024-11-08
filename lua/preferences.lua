-- Line numbers
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- Tabs and indentation
vim.opt.expandtab = false     -- Use tabs instead of spaces
vim.opt.tabstop = 4          -- Number of spaces tabs count for
vim.opt.shiftwidth = 4       -- Size of an indent
vim.opt.softtabstop = 4      -- Number of spaces that a <Tab> counts for
vim.opt.autoindent = true    -- Copy indent from current line when starting new one

-- Line display
vim.opt.cursorline = true    -- Highlight the current line
vim.opt.wrap = false         -- Display long lines as just one line
vim.opt.linebreak = true     -- Companion to wrap, don't split words

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Search
vim.opt.ignorecase = true    -- Ignore case in search patterns
vim.opt.smartcase = true     -- Override ignorecase if search pattern has uppercase

-- File handling
vim.opt.swapfile = false     -- Don't create swap files
vim.opt.backup = false       -- Don't create backup files
vim.opt.undofile = true      -- Persistent undo
vim.opt.hidden = true        -- Enable modified buffers in background

-- UI
vim.opt.termguicolors = true -- True color support
vim.opt.showmode = false     -- Don't show mode since we have a statusline
vim.opt.signcolumn = "yes"   -- Always show the signcolumn
vim.opt.scrolloff = 8        -- Minimum number of screen lines above and below cursor
vim.opt.sidescrolloff = 8    -- Minimum number of screen columns to keep to the left and right of the cursor

-- Performance
vim.opt.updatetime = 250     -- Faster completion
vim.opt.timeoutlen = 300     -- Time in milliseconds to wait for a mapped sequence to complete

-- Split windows
vim.opt.splitright = true    -- Force all vertical splits to go to the right of current window
vim.opt.splitbelow = true    -- Force all horizontal splits to go below current window

-- Commands
vim.opt.wildmenu = true      -- Command-line completion mode
vim.opt.wildmode = "longest:full,full" -- Complete the longest common string, then each full match

-- Mouse
vim.opt.mouse = "a"          -- Enable mouse support
