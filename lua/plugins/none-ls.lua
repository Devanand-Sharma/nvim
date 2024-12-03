return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		
		-- Configure formatters and diagnostics
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			sources = {
				-- Lua
				formatting.stylua,
				
				-- Python
				formatting.black.with({ 
					extra_args = { "--fast", "--line-length=88" } 
				}),
				formatting.isort,

				
				-- C/C++
				formatting.clang_format.with({
					extra_args = { 
						"--style={BasedOnStyle: google, IndentWidth: 4, ColumnLimit: 100}"
					},
				}),
				
				-- Go
				formatting.gofumpt,
				formatting.goimports_reviser,
				code_actions.gomodifytags,
				diagnostics.golangci_lint,

				-- TypeScript/JavaScript
				formatting.prettier.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"css",
						"scss",
						"less",
						"html",
						"json",
						"jsonc",
						"yaml",
						"markdown",
						"markdown.mdx",
						"graphql",
						"handlebars",
					},
					extra_args = {
						"--single-quote",
						"--jsx-single-quote",
						"--trailing-comma=es5",
						"--arrow-parens=avoid",
						"--print-width=100",
						"--tab-width=2",
					},
				}),
			},
			-- Debug settings (optional, helps with troubleshooting)
			debug = false,
			log_level = "warn",
			-- Increase timeout
			format_timeout = 10000,
		})
	end,
}
