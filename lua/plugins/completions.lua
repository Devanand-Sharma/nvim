return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-omni",
			"kdheepak/cmp-latex-symbols",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local luasnip = require("luasnip")

			-- Load friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Load latex-specific snippets
			luasnip.filetype_extend("tex", { "latex" })

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "latex-symbols" },
					{
						name = "omni",
						-- Only enable omni completion for tex files
						filter = function(buffer)
							return vim.bo[buffer.bufnr].filetype == "tex"
						end,
					},
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = {
							menu = 50,
							abbr = 50,
						},
						ellipsis_char = "...",
						show_labelDetails = true,
						before = function(entry, vim_item)
							-- Add LaTeX symbol kinds
							if entry.source.name == "latex-symbols" then
								vim_item.kind = "Ω"
							end
							return vim_item
						end,
					}),
				},
			})

			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})

			-- Set up special completion for tex files
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "tex",
				callback = function()
					cmp.setup.buffer({
						sources = {
							{ name = "nvim_lsp" },
							{ name = "luasnip" },
							{ name = "buffer" },
							{ name = "path" },
							{ name = "latex-symbols" },
							{ name = "omni" },
						},
					})
				end,
			})
		end,
	},
}
