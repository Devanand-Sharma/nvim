return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local servers = {}
			
			-- Check for Python
			if vim.fn.executable('python') == 1 or vim.fn.executable('python3') == 1 then
				table.insert(servers, "pyright")
				table.insert(servers, "ruff_lsp")
			end

			-- Check for C/C++
			if vim.fn.executable('gcc') == 1 or vim.fn.executable('clang') == 1 then
				table.insert(servers, "clangd")
			end

			-- Check for CMake
			if vim.fn.executable('cmake') == 1 then
				table.insert(servers, "cmake")
			end

			-- Check for Go
			if vim.fn.executable('go') == 1 then
				table.insert(servers, "gopls")
				table.insert(servers, "golangci_lint_ls")
			end

			-- Check for LaTeX
			if vim.fn.executable('latex') == 1 or vim.fn.executable('pdflatex') == 1 then
				table.insert(servers, "texlab")
			end

			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Only setup LSP if the corresponding executable is available
			if vim.fn.executable('python') == 1 or vim.fn.executable('python3') == 1 then
				lspconfig.pyright.setup({
					capabilities = capabilities,
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								diagnosticMode = "workspace",
							},
						},
					},
				})

				lspconfig.ruff_lsp.setup({
					capabilities = capabilities,
					init_options = {
						settings = {
							args = {},
						},
					},
				})
			end

			if vim.fn.executable('gcc') == 1 or vim.fn.executable('clang') == 1 then
				lspconfig.clangd.setup({
					capabilities = capabilities,
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
						"--header-insertion=iwyu",
						"--completion-style=detailed",
						"--function-arg-placeholders",
					},
				})
			end

			if vim.fn.executable('cmake') == 1 then
				lspconfig.cmake.setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
