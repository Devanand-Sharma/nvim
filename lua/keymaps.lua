-- File Navigation
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>")

-- Code formatting and editing
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

-- LSP keymaps with logical groupings
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })

-- 'l' prefix for "language" actions (LSP)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format code" })

-- 'h' for help/documentation
vim.keymap.set("n", "<leader>hk", vim.lsp.buf.hover, { desc = "Show hover documentation" })
vim.keymap.set("n", "<leader>hs", vim.lsp.buf.signature_help, { desc = "Show signature help" })

-- 'd' for diagnostics
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>dd", vim.diagnostic.setloclist, { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>dw", vim.diagnostic.setqflist, { desc = "Workspace diagnostics" })
