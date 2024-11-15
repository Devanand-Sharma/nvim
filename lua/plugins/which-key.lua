return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
		local wk = require("which-key")
		wk.add({
			-- File Operations
			{ "<leader>f", group = "File" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find File", mode = "n" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep", mode = "n" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files", mode = "n" },
			-- Buffer operations
			{ "<leader>b", group = "Buffers", expand = function()
					return require("which-key.extras").expand.buf()
				end
			},
			{ "<leader>bx", "<cmd>BufferClose<CR>", desc = "Close Buffer", mode = "n" },
			{ "<leader>br", "<cmd>BufferRestore<CR>", desc = "Restore Buffer", mode = "n" },
			-- Git operations
			{ "<leader>h", group = "Git Hunk" },
			{ "<leader>hp", function()
					require("gitsigns").preview_hunk()
				end
			,desc = "Preview Hunk", mode = "n" },
			{ "<leader>hh", function()
					require("gitsigns").prev_hunk()
				end
			,desc = "Previous Hunk", mode = "n" },
			{ "<leader>hl", function()
					require("gitsigns").next_hunk()
				end
			,desc = "Next Hunk", mode = "n" },
			{ "<leader>hu", function()
					require("gitsigns").reset_hunk()
				end
			,desc = "Reset Hunk", mode = "n" },
			-- LaTeX operations
			{ "<leader>t", group = "LaTeX" },
			{ "<leader>tc", ":VimtexCompile<CR>", desc = "Compile", mode = "n" },
			{ "<leader>tt", "<cmd>VimtexTocToggle<CR>", desc = "Toggle TOC", mode = "n" },
			{ "<leader>tv", "<cmd>VimtexView<CR>", desc = "View", mode = "n" },
			{ "<leader>ts", "<cmd>VimtexDocPackage<CR>", desc = "Document Package", mode = "n" },
			{ "<leader>te", "<cmd>VimtexErrors<CR>", desc = "Show Errors", mode = "n" },
			{ "<leader>tk", "<cmd>VimtexClean<CR>", desc = "Clean", mode = "n" },
			{ "<leader>ti", "<cmd>VimtexInfo<CR>", desc = "Info", mode = "n" },
			-- LSP Go to operations
			{ "<leader>g", group = "Go to" },
			{ "<leader>gd", vim.lsp.buf.definition, desc = "Go to Definition", mode = "n" },
			{ "<leader>gD", vim.lsp.buf.declaration, desc = "Go to Declaration", mode = "n" },
			{ "<leader>gr", vim.lsp.buf.references, desc = "Go to References", mode = "n" },
			{ "<leader>gi", vim.lsp.buf.implementation, desc = "Go to Implementation", mode = "n" },
			{ "<leader>gt", vim.lsp.buf.type_definition, desc = "Go to Type Definition", mode = "n" },
			-- LSP language actions
			{ "<leader>l", group = "LSP" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename Symbol", mode = "n" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions", mode = "n" },
			{ "<leader>lf", vim.lsp.buf.format, desc = "Format Code", mode = "n" },
			-- Help/Documentation
			{ "<leader>k", group = "Help" },
			{ "<leader>kk", vim.lsp.buf.hover, desc = "Show Hover Documentation", mode = "n" },
			{ "<leader>ks", vim.lsp.buf.signature_help, desc = "Show Signature Help", mode = "n" },
			-- Diagnostics
			{ "<leader>d", group = "Diagnostics" },
			{ "<leader>dl", vim.diagnostic.open_float, desc = "Line Diagnostics", mode = "n" },
			{ "<leader>dn", vim.diagnostic.goto_next, desc = "Next Diagnostic", mode = "n" },
			{ "<leader>dp", vim.diagnostic.goto_prev, desc = "Previous Diagnostic", mode = "n" },
			{ "<leader>dd", vim.diagnostic.setloclist, desc = "Document Diagnostics", mode = "n" },
			{ "<leader>dw", vim.diagnostic.setqflist, desc = "Workspace Diagnostics", mode = "n" },
			-- Session management
			{ "<leader>s", group = " Session" },
			{ "<leader>ss", "<cmd>SessionSave<CR>", desc = "Save Session", mode = "n" },
			{ "<leader>sl", "<cmd>SessionLoad<CR>", desc = "Load Session", mode = "n" },
			{ "<leader>sd", "<cmd>SessionDelete<CR>", desc = "Delete Session", mode = "n" },
			-- Neotree Toggle
			{ "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neotree", mode = "n" },
			-- Python Interpreter Selector
			{ "<leader>ps", "<cmd>SelectPythonInterpreter<CR>", desc = "󰌠 Select Python Interpreter", mode = "n" },
		})      
    end,
  }
