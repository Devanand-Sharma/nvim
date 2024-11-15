-- Code formatting and editing
vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Buffer navigation 
vim.keymap.set("n", "L", ":BufferNext<CR>")
vim.keymap.set("n", "H", ":BufferPrevious<CR>")

-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

