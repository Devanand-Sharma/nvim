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
			require("mason-lspconfig").setup({
				ensure_installed = {
					"texlab",
					"gopls",
					"golangci_lint_ls",
					"pyright",
					"ruff_lsp",
					"clangd",
					"cmake",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

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

			lspconfig.cmake.setup({
				capabilities = capabilities,
			})
		end,
	},
}
