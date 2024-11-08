return {
	"rcarriga/nvim-notify",

	config = function()
		vim.notify = require("notify")

		require("notify")("Hello, Dev!")
		vim.notify.setup({
			background_color = "#000000",
		})
	end
}
