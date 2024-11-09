return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_compiler_latexmk = {
			executable = "latexmk",
			options = {
				"-pdf",
				"-shell-escape",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}
		-- Enable syntax concealment
		vim.g.vimtex_syntax_conceal = {
			accents = 1,
			ligatures = 1,
			cites = 1,
			fancy = 1,
			greek = 1,
			math_bounds = 1,
			math_delimiters = 1,
			math_fracs = 1,
			math_super_sub = 1,
			math_symbols = 1,
			sections = 1,
		}
		-- Configure default quickfix window behavior
		vim.g.vimtex_quickfix_open_on_warning = 0
	end,
}
