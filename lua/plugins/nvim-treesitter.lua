return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		  local configs = require("nvim-treesitter.configs")

		  configs.setup({
			  ensure_installed = { 
				  "c", "cpp", "python", "lua", "vim", 
				  "vimdoc", "javascript", "html", "go",
				  "cmake", "make", "ninja", "rst", "toml",
			  },
			  sync_install = false,
			  highlight = { 
				  enable = true,
				  additional_vim_regex_highlighting = false,
			  },
			  indent = { enable = true },
			  incremental_selection = {
				  enable = true,
				  keymaps = {
					  init_selection = "<CR>",
					  node_incremental = "<CR>",
					  node_decremental = "<BS>",
					  scope_incremental = "<TAB>",
				  },
			  },
			})
	end
}
