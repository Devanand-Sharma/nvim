return {
	"rcarriga/nvim-notify",

	config = function()
		vim.notify = require("notify")

		require("notify")("Hello, Dev!")
	end
}
