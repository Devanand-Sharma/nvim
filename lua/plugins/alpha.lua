return {
	"goolord/alpha-nvim",

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[██████╗ ███████╗██╗   ██╗███████╗    ██╗   ██╗██╗███╗   ███╗]],
			[[██╔══██╗██╔════╝██║   ██║██╔════╝    ██║   ██║██║████╗ ████║]],
			[[██║  ██║█████╗  ██║   ██║███████╗    ██║   ██║██║██╔████╔██║]],
			[[██║  ██║██╔══╝  ╚██╗ ██╔╝╚════██║    ╚██╗ ██╔╝██║██║╚██╔╝██║]],
			[[██████╔╝███████╗ ╚████╔╝ ███████║     ╚████╔╝ ██║██║ ╚═╝ ██║]],
			[[╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝      ╚═══╝  ╚═╝╚═╝     ╚═╝]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰍉  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("g", "󰈞  > Find in file", ":Telescope live_grep<CR>"),
			dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", "󰈆  > Quit NVIM", ":qa<CR>"),
		}

		local function footer()
			local total_plugins = #vim.tbl_keys(require("lazy").plugins())
			local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
			local version = vim.version()
			local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

			return string.format("⚡ %d plugins loaded   %s   %s", total_plugins, datetime, nvim_version_info)
		end

		dashboard.section.footer.val = footer()

		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		alpha.setup(dashboard.opts)

		vim.cmd([[
			autocmd FileType alpha setlocal nofoldenable
		]])
	end,
}
