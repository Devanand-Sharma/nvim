-- File Navigation
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>")

-- Code formatting and editing
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>/", ":CommentToggle<CR>")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

-- Buffer management
vim.keymap.set("n", "L", ":BufferNext<CR>")
vim.keymap.set("n", "H", ":BufferPrevious<CR>")
vim.keymap.set("n", "<leader>bx", ":BufferClose<CR>")
vim.keymap.set("n", "<leader>br", ":BufferRestore<CR>")

-- Git operations
vim.keymap.set("n", "<leader>gph", function()
	require("gitsigns").preview_hunk()
end)
vim.keymap.set("n", "<leader>guh", function()
	require("gitsigns").reset_hunk()
end)
vim.keymap.set("n", "<leader>ghh", function()
	require("gitsigns").prev_hunk()
end)
vim.keymap.set("n", "<leader>glh", function()
	require("gitsigns").next_hunk()
end)

-- Clear search highlight
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-- LaTeX keymaps
vim.keymap.set("n", "<leader>lc", ":VimtexCompile<CR>")
vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>")
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>")
vim.keymap.set("n", "<leader>ls", "<cmd>VimtexDocPackage<CR>")
vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>")
vim.keymap.set("n", "<leader>lk", "<cmd>VimtexClean<CR>")
vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<CR>")
